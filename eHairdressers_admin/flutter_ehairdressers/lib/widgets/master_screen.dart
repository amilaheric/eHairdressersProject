import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_ehairdressers/providers/employee_provider.dart';
import 'package:flutter_ehairdressers/screens/employee_add_screen.dart';

import 'package:flutter_ehairdressers/screens/product_insert_screen.dart';
import 'package:flutter_ehairdressers/screens/reservation_list.dart';
import 'package:provider/provider.dart';

import '../models/search_result.dart';
import '../models/user.dart';

class MasterScreenWidget extends StatefulWidget {
  Widget? child;
  String? title;
  User? user;
  MasterScreenWidget({this.child, this.title, this.user, Key? key})
      : super(key: key);
  @override
  State<MasterScreenWidget> createState() => _MasterScreenWidgetState();
}

class _MasterScreenWidgetState extends State<MasterScreenWidget> {
  late EmployeeProvider _employeeProvider;
  SearchResult<User>? userresult;

  @override
  void initState() {
    super.initState();

    _employeeProvider = context.read<EmployeeProvider>();
    initForm();
  }

  Future initForm() async {
    userresult = await _employeeProvider.get();
    print(userresult?.result?.firstOrNull?.username);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? "",
            style: TextStyle(color: Color(0x0FFe5c89d))),
        backgroundColor: Color(0x0FF13414b),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(children: [
              Icon(Icons.person, color: Colors.white),
              SizedBox(width: 8),
              Text(userresult?.result?.firstOrNull?.username ?? "unkonwn",
                  style: TextStyle(color: Colors.white)),
            ]),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text("Reservations"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ReservationList()));
              },
            ),
            ListTile(
              title: Text("Upload product"),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProductInsert()));
              },
            ),
            ListTile(
              title: Text("Upload employee"),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EmployeeAdd()));
              },
            ),
            ListTile(
              title: Text("Back"),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      body: widget.child!,
    );
  }
}
