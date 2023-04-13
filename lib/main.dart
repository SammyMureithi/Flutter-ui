// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, unused_local_variable, no_leading_underscores_for_local_identifiers, prefer_interpolation_to_compose_strings, avoid_unnecessary_containers

import 'package:drink_app/Screens/DetailedDrinkScreen.dart';
import 'package:drink_app/ViewModel/DrinksViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => DrinksViewModel(),
        child: MaterialApp(
          home: Home(),
        ));
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late DrinksViewModel _drinkViewModel;
  @override
  void initState() {
    super.initState();
    _drinkViewModel = Provider.of<DrinksViewModel>(context, listen: false);
    _drinkViewModel.fetchDrinks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drinks"),
      ),
      body: Consumer<DrinksViewModel>(
        builder: (context, drinkView, child) {
          if (drinkView.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: drinkView.drinks.length,
              itemBuilder: (context, index) {
                final drink = drinkView.drinks[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailedDrinkScreen(drink: drink),
                        ));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 2, horizontal: 3),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.green,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: ListTile(
                      title: Text(" Name: " + drink.strDrink),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _drinkViewModel.fetchDrinks, child: Text("Click")),
    );
  }
}
