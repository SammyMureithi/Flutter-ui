import 'package:drink_app/Model/DrinksModel.dart';
import 'package:flutter/material.dart';

class DetailedDrinkScreen extends StatelessWidget {
  const DetailedDrinkScreen({super.key, required this.drink});
  final DrinksModel drink;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(drink.strDrink),
      ),
      body: Center(
        child: Image.network(
          "${drink.strDrinkThumb}",
          width: 200,
          height: 300,
        ),
      ),
    );
  }
}
