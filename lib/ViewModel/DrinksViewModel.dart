// ignore_for_file: non_constant_identifier_names, unused_local_variable, avoid_function_literals_in_foreach_calls

import 'dart:convert';
import 'package:drink_app/Model/DrinksModel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class DrinksViewModel extends ChangeNotifier {
  List<DrinksModel> _drinks = [];
  List<DrinksModel> get drinks => _drinks;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  Future<void> fetchDrinks() async {
    _isLoading = true;
    notifyListeners();
    Fluttertoast.showToast(
        msg: "Fetching Users",
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0);
    final response = await http.get(Uri.parse(
        "https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Non_Alcoholic"));

    if (response.statusCode == 200) {
      _isLoading = false;
      Fluttertoast.showToast(
          msg: "Success",
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      final data1 = jsonDecode(response.body);
      List<dynamic> data = data1['drinks'];
      List<DrinksModel> loadedData = [];
      data.forEach((element) {
        loadedData.add(DrinksModel.fromJson(element));
      });
      _drinks = loadedData;

      notifyListeners();
    } else {
      Fluttertoast.showToast(
          msg: "Failed",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      _isLoading = false;
      notifyListeners();
    }
  }

  String get name => _drinks.first.strDrink;
  String get img => _drinks.first.strDrinkThumb;
}
