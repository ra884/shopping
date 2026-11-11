import 'package:flutter/material.dart';
import 'package:flutter_shopping/cartpage.dart';
import 'package:flutter_shopping/customcard.dart';
import 'package:flutter_shopping/product.dart';

class Productspage extends StatelessWidget {
  List<product> CartItems = [];
  void addToCart(product item) {
    item.quantity++;
    if (!CartItems.contains(item)) {
      CartItems.add(item);
    }
  }

  Productspage({super.key});
  List<product> items = [
    product(icon: Icons.watch, name: "Smart Watch", price: 450),
    product(icon: Icons.headphones, name: "HeadPhone", price: 50),
    product(icon: Icons.laptop, name: "LapTop", price: 30),
    product(icon: Icons.camera, name: "Camera", price: 70),
    product(icon: Icons.phone, name: "SmartPhone", price: 60),
    product(icon: Icons.tablet, name: "Tablet", price: 20),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 223, 166, 233),
        title: Text(
          "Shopping",
          style: TextStyle(
            fontSize: 20,
            fontWeight: .bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: 600,
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, index) =>
                      CustomCard(item: items[index], onAdd: addToCart),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.shopping_cart),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartPage(cartItems: CartItems),
            ),
          );
        },
      ),
    );
  }
}
