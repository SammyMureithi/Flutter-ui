// To parse this JSON data, do
//
//     final drinksModel = drinksModelFromJson(jsonString);

import 'dart:convert';

List<DrinksModel> drinksModelFromJson(String str) => List<DrinksModel>.from(
    json.decode(str).map((x) => DrinksModel.fromJson(x)));

String drinksModelToJson(List<DrinksModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DrinksModel {
  DrinksModel({
    required this.strDrink,
    required this.strDrinkThumb,
    required this.idDrink,
  });

  String strDrink;
  String strDrinkThumb;
  String idDrink;

  factory DrinksModel.fromJson(Map<String, dynamic> json) => DrinksModel(
        strDrink: json["strDrink"],
        strDrinkThumb: json["strDrinkThumb"],
        idDrink: json["idDrink"],
      );

  Map<String, dynamic> toJson() => {
        "strDrink": strDrink,
        "strDrinkThumb": strDrinkThumb,
        "idDrink": idDrink,
      };
}
