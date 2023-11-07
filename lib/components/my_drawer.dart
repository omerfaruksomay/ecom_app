import 'package:ecom_app/components/my_list_tile.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                child: Icon(
                  Icons.shopping_bag,
                  size: 72,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              const SizedBox(height: 25),
              MyListTile(
                text: "Shop",
                icon: Icons.home,
                onTap: () {
                  Navigator.pop(context);
                  String? currentRouteName =
                      ModalRoute.of(context)?.settings.name;
                  if (currentRouteName == '/cart_screen') {
                    Navigator.pushNamed(context, '/shop_screen');
                  }
                },
              ),
              MyListTile(
                text: "Cart",
                icon: Icons.shopping_cart,
                onTap: () {
                  String? currentRouteName =
                      ModalRoute.of(context)?.settings.name;
                  //Pop drawer first
                  Navigator.pop(context);

                  //go to chart page
                  if (currentRouteName == '/shop_screen') {
                    Navigator.pushNamed(context, '/cart_screen');
                  }
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListTile(
              text: "Exit",
              icon: Icons.logout,
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/intro_screen', (route) => false);
              },
            ),
          ),
        ],
      ),
    );
  }
}
