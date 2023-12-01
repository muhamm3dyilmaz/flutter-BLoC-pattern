import 'package:bloc_demo/blocs/cart_bloc.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        backgroundColor: Colors.orange,
      ),
      body: StreamBuilder(
        initialData: cartBloc.getCart(),
        stream: cartBloc.getStream,
        builder: (ctx, snapshot) {
          return snapshot.data.length > 0 ? buildCart(snapshot) : const Center(child: Text("No Item Found in Cart!"));
        },
      ),
    );
  }

  buildCart(AsyncSnapshot snapshot) {
    return ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (ctx, index) {
        final cart = snapshot.data;
        return ListTile(
          title: Text(cart[index].product.name),
          subtitle: Text(cart[index].product.price.toString()),
          trailing: IconButton(
            onPressed: () {
              cartBloc.removeFromCart(cart[index]);
            },
            icon: const Icon(Icons.delete),
            color: Colors.red,
          ),
        );
      },
    );
  }
}
