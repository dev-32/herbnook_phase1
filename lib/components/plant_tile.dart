import 'package:flutter/material.dart';

import '../models/plant.dart';

class PlantTile extends StatelessWidget {
  PlantTile({super.key, required this.plant, required this.onTap, required this.trailing});
  final Plant plant;
  final Widget trailing;
  final  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: EdgeInsets.only(top:8,bottom: 8),
        decoration: BoxDecoration(
          color: Colors.green.shade100,
          borderRadius: BorderRadius.circular(12)
        ),
        child: ListTile(
          title: Text(plant.name),
          subtitle: Text('₹${plant.price}'),
          leading: Image.asset(plant.imagePath),
          trailing: trailing,
        ),
      ),
    );
  }
}
