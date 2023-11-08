import 'package:ecom_app/components/my_button.dart';
import 'package:ecom_app/components/my_drawer.dart';
import 'package:ecom_app/models/product_model.dart';
import 'package:ecom_app/models/shop_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  //remove items from cart
  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text("Remove this item from your cart"),
        actions: [
          //cancel button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          MaterialButton(
            onPressed: () {
              //pop dialog box
              Navigator.pop(context);

              context.read<Shop>().removeFromCart(product);
            },
            child: const Text("Yes"),
          )
        ],
      ),
    );
  }

  //PAY NOW button
  void payButtonPressed(BuildContext context) {
    final double amount = context.read<Shop>().getAmountOfCart();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(
            "Amount: $amount User wants to pay! Connect this app to your payment backend"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //get access to cart
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Cart Screen"),
      ),
      drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          //cart list
          Expanded(
            child: cart.isEmpty
                ? const Center(child: Text("Your Cart is empty!"))
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final item = cart[index];
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text('\$ ${item.price.toStringAsFixed(2)}'),
                        trailing: IconButton(
                          onPressed: () => removeItemFromCart(context, item),
                          icon: const Icon(Icons.remove),
                        ),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(50),
            child: MyButton(
                onTap: () => payButtonPressed(context),
                child: const Text("PAY NOW")),
          )
        ],
      ),
    );
  }
}
