import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';
import '../models/order.dart';
import '../providers/cart_provider.dart';
import '../providers/order_item_provider.dart';
import '../providers/order_provider.dart';
import '../utils/authorization.dart';
import '../widgets/master_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late CartProvider _cartProvider;
  final OrderProvider _orderProvider = OrderProvider();
  Orders _orders = Orders();
  final OrderItemProvider _orderItemProvider = OrderItemProvider();
  Map<String, dynamic>? payementIntentData;
  double checkout = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _cartProvider = context.read<CartProvider>();
  }

  @override
  Widget build(BuildContext context) {
    return MasterScreenWidget(
      title: "Cart",
      child: Column(
        children: [Expanded(child: _buildProductCardlist()), _buildBuyButton()],
      ),
    );
  }

  Widget _buildProductCardlist() {
    return Container(
      child: ListView.builder(
          itemCount: _cartProvider.cart.items.length,
          itemBuilder: (context, index) {
            return _buildProductCard(_cartProvider.cart.items[index]);
          }),
    );
  }

  Widget _buildProductCard(CartItem item) {
    return Card(
      child: ListTile(
        leading: Container(
          width: 100,
          height: 100,
          child: imageFromBase64String(item.product.image!),
        ),
        title: Text(item.product.name ?? ""),
        subtitle: Text(item.product.price.toString()),
        trailing: Column(children: [
          Expanded(
              child: Text(
            item.count.toString(),
            style: TextStyle(
              fontSize: 18,
            ),
          )),
          Expanded(
              child: IconButton(
                  onPressed: () {
                    _cartProvider?.removeFromCart(item.product);
                  },
                  icon: Icon(Icons.delete)))
        ]),
      ),
    );
  }

  Widget _buildBuyButton() {
    return Expanded(
        child: Align(
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () async {
          checkout = sumAll();
        },
        child: Text("Buy"),
        style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 247, 233, 211),
            foregroundColor: Color(0x0FF938f94)),
      ),
    ));
  }

  double sumAll() {
    _cartProvider.cart.items.forEach((element) {
      checkout += (element.product.price! * element.count).toDouble();
    });
    return checkout;
  }
}
