import 'package:herb_nook/models/shop.dart';
import 'package:herb_nook/pages/order_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/plant_tile.dart';
import '../models/plant.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  void goToOrderPage(Plant plant){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderPage(plant:plant)));
  }
  @override
  Widget build(BuildContext context) {
    return  Consumer<HerbNook>(
      builder: (context,value, child)=>SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Expanded(child: ListView.builder(
                itemCount: value.shop.length,
                  itemBuilder: (context, index) {
                  Plant individualDrink = value.shop[index];
                  return PlantTile(plant: individualDrink,
                  onTap:()=>goToOrderPage(individualDrink),
                  trailing: Icon(Icons.arrow_forward),);
                  }
                  )
              ),

            ],
          ),
        ),
      ),
    );
  }
}
