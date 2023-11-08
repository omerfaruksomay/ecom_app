import 'package:ecom_app/components/my_drawer.dart';
import 'package:ecom_app/components/my_product_tile.dart';
import 'package:ecom_app/models/shop_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //access products
    final products = context.watch<Shop>().shop;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Shop Screen"),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      drawer: const MyDrawer(),
      body: ListView(
        children: [
          const SizedBox(height: 25),
          Center(
            child: Text(
              "Pick from a selected list of premium products",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ),
          SizedBox(
            height: 500,
            child: ListView.builder(
              itemCount: products.length,
              padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final product = products[index];

                return MyProductTile(product: product);
              },
            ),
          ),
        ],
      ),
    );
  }
}
