import 'package:herb_nook/components/plant_tile.dart';
import 'package:herb_nook/models/shop.dart';
import 'package:herb_nook/services/stripe_payment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/plant.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool _status  = false;
  void removeFromCart(Plant plant){
    Provider.of<HerbNook>(context, listen: false).removeFromCart(plant);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<HerbNook>(
        builder: (context, value, child)=> Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              Text('CART', style: TextStyle(fontSize: 20,
              color: Colors.green.shade800,
              fontWeight: FontWeight.w400,
              letterSpacing: 2),),
              Expanded(
                child: ListView.builder(
                  itemCount: value.cart.length,
                    itemBuilder: (context,index){
                    Plant plant = value.cart[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: PlantTile(
                          plant: plant,
                          onTap: ()=> removeFromCart(plant),
                          trailing: Icon(Icons.delete,
                          color: Colors.red.shade300,)),
                    );
                    }),
              ),
              Container(
                width: 200,
                height: 60,
                margin: EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: TextButton(onPressed:(){
                  int totalPrice =0;
                  for(int i=0;i<value.cart.length;i++){
                    totalPrice += int.parse(value.cart[i].price);
                  }
                  totalPrice *=100;
                  print(totalPrice);
                  if(totalPrice != 0) {
                    StripePayment((value) => {
                      _status = value
                    },
                    amount: totalPrice.toString()).makePayment();
                    value.addToOCart();
                  }
                },
                child: const Text('Pay now',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15
                ),),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
