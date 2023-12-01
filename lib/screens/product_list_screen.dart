import 'package:bloc_demo/blocs/cart_bloc.dart';
import 'package:bloc_demo/blocs/product_bloc.dart';
import 'package:bloc_demo/models/cart.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "cart");
            },
            icon: const Icon(Icons.shopping_bag),
          ),
        ],
      ),
      body: buildProductList(),
    );
  }

  buildProductList() {
    return StreamBuilder(
      initialData: productBloc.getAllProducts(),
      stream: productBloc.getStream,
      builder: (ctx, snapshot) {
        return snapshot.data.length > 0
            ? buildProductListItems(snapshot)
            : const Center(
                child: Text("No Product Found!"),
              );
      },
    );
  }

  buildProductListItems(AsyncSnapshot snapshot) {
    return ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (ctx, index) {
        final list = snapshot.data;
        return ListTile(
          title: Text(list[index].name),
          subtitle: Text(list[index].price.toString()),
          trailing: IconButton(
              onPressed: () {
                cartBloc.addToCart(Cart(list[index], 1));
              },
              icon: const Icon(Icons.add_shopping_cart_rounded)),
        );
      },
    );
  }
}
