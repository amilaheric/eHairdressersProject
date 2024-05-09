import 'package:flutter/material.dart';
import '../screens/cart_screen.dart';
import '../screens/product_list_screen.dart';

class MasterScreenWidget extends StatefulWidget {
  Widget? child;
  String? title;
  MasterScreenWidget({this.child, this.title, Key? key}) : super(key: key);

  @override
  State<MasterScreenWidget> createState() => _MasterScreenWidgetState();
}

class _MasterScreenWidgetState extends State<MasterScreenWidget> {
  int currentIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
    if (currentIndex == 0) {
      //Navigator.pushNamed(context, ProductListScreen.routeName);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => ProductListScreen()));
    } else if (currentIndex == 1) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => CartScreen()));
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? "",
            style: TextStyle(color: Color(0x0FFe5c89d))),
        backgroundColor: Color(0x0FF13414b),
      ),
      body: SafeArea(child: widget.child!),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Cart')
        ],
        selectedItemColor: Color(0x0FFe5c89d),
        currentIndex: currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
