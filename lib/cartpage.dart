import 'package:flutter/material.dart';
import 'package:flutter_shopping/product.dart';

class CartPage extends StatefulWidget {
  final List<product> cartItems;
  CartPage({super.key, required this.cartItems});

  @override
  State<CartPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CartPage> {
  double CalcAmount(List<product> items) {
    double Amount = 0;

    for (var item in items) {
      Amount += item.price * item.quantity;
    }
    return Amount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My cart",
          style: TextStyle(
            fontSize: 20,
            fontWeight: .bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 223, 166, 233),
      ),

      body: Center(
        child: Container(
          width: 600,
          child: ListView.builder(
            itemCount: widget.cartItems.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: ListTile(
                  iconColor: const Color.fromARGB(255, 227, 114, 240),
                  tileColor: const Color.fromARGB(255, 202, 214, 236),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  leading: Icon(widget.cartItems[index].icon),
                  title: Text(widget.cartItems[index].name),
                  subtitle: Text("\$${widget.cartItems[index].price}"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 10,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.cartItems[index].quantity++;
                          });
                        },
                        child: Text("+", style: TextStyle(fontSize: 20)),
                      ),
                      Text(
                        "${widget.cartItems[index].quantity}",
                        style: TextStyle(fontSize: 20, fontWeight: .bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (widget.cartItems[index].quantity > 1) {
                              widget.cartItems[index].quantity--;
                            } else {
                              widget.cartItems.remove(widget.cartItems[index]);
                            }
                          });
                        },
                        child: Text("-", style: TextStyle(fontSize: 20)),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: const Color.fromARGB(255, 205, 196, 199),
        child: Row(
          mainAxisAlignment: .center,
          children: [
            Center(
              child: Text(
                "Total amount : \$${CalcAmount(widget.cartItems)}",
                style: TextStyle(fontSize: 15, fontWeight: .bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
