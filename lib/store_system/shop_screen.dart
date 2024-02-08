import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quadro/components/my_drawer.dart';
import 'package:quadro/store_system/component/my_product_tile.dart';
import 'package:quadro/store_system/models/shop.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    // acces product in shop
    final products = context.watch<Shop>().shop;
    final product = context.watch<Shop>().shop;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Store Page"),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/cart_screen'),
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        children: [
          const SizedBox(height: 25),
          //shop subtitle
          Center(
            child: Text(
              "Pick from a selected list of premium product",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
          //product list
          SizedBox(
            height: 550,
            child: ListView.builder(
              itemCount: product.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(15),
              itemBuilder: (context, index) {
                //get each individual product from shop
                final product = products[index];

                //return as a product tile UI
                return MyProductTile(product: product);
              },
            ),
          ),
        ],
      ),
    );
  }
}
