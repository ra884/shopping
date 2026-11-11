import 'package:flutter/material.dart';
import 'package:flutter_shopping/product.dart';

class CustomCard extends StatefulWidget {
  final product item;
   final void Function(product) onAdd;

  CustomCard({super.key, required this.item,required this.onAdd});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        spacing: 10,
        crossAxisAlignment: .center,
        mainAxisAlignment: .center,
        children: [
          Icon(widget.item.icon),
          Text(widget.item.name),
          Text("\$${widget.item.price.toString()}"),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: isClicked == false
                  ? const Color.fromARGB(255, 76, 133, 78)
                  : Colors.red,
            ),
            onPressed: () {
              widget.onAdd(widget.item);
              setState(() {
                isClicked = !isClicked;
                
              });
              
            },
            child: Text(
              isClicked == false ? "Add to cart" : "Added",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
