import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quadro/components/my_button.dart';
import 'package:quadro/store_system/models/shop.dart';

import 'models/product.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  //remove item from the cart
  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text("Remove this item from your cart?"),
        actions: [
          // cancel button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          // yes button
          MaterialButton(
            // pop dialog box
            onPressed: () {
              Navigator.pop(context);
              context.read<Shop>().removeFromCart(product);
            },

            child: const Text("Yes"),
          ),
        ],
      ),
    );
  }

  // user pressed pay button
  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        content: Text("User wants to pay!"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //get access to the cart
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Cart Page"),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Expanded(
            child: cart.isEmpty
                ? const Center(child: Text("Your cart is empty.."))
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      // get indivdual item in  cart
                      final item = cart[index];

                      //return as a cart tile UI
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text(
                          item.price.toStringAsFixed(2),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () => removeItemFromCart(context, item),
                        ),
                      );
                    },
                  ),
          ),

          //pay button
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButtonBox(
                onTap: () => payButtonPressed(context), child: const Text("Pay Now")),
          )
        ],
      ),
    );
  }
}
