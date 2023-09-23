import 'package:herb_nook/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/plant.dart';

class OrderPage extends StatefulWidget {
  final Plant plant;
  const OrderPage({super.key, required this.plant});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  void addToCart() {
    Provider.of<HerbNook>(context, listen: false).addToCart(widget.plant);
    Navigator.pop(context);
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          icon: Center(
            child: Container(
              padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.green.shade200,
              borderRadius: BorderRadius.circular(50)
            ),
              child: const Icon(Icons.done, color: Colors.green,),),
          ),
          backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: Colors.green,
                ),
                    borderRadius: BorderRadius.circular(12)
              ),
              title: const Text('Successfully Added',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 2,
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.green.shade800),
        title: Text(
          widget.plant.name.toUpperCase(),
          style: TextStyle(
              color: Colors.green.shade800,
              fontWeight: FontWeight.bold,
              fontSize: 23),
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.green.shade200,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
            height: 200,
            width: 200,
            decoration: BoxDecoration(
                color: Colors.green.shade100,
                border: Border.all(color: Colors.green, width: 2),
                borderRadius: BorderRadius.circular(12)),
            child: Image.asset(
              widget.plant.imagePath,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(top: 8, bottom: 8),
                child: Text(
                  widget.plant.description,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.green.shade900,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
          SafeArea(
            child: GestureDetector(
              onTap: addToCart,
              child: Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: const Center(
                  child: Text(
                    'Add to cart',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ),
            )
          )
        ],
      ),
    );
  }
}
