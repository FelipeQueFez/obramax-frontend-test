// To parse this JSON data, do
//
//     final catModel = catModelFromJson(jsonString);

import 'dart:convert';

CatModel catModelFromJson(String str) => CatModel.fromJson(json.decode(str));

String catModelToJson(CatModel data) => json.encode(data.toJson());

class CatModel {
  final String id;
  final String name;
  final int age;
  final String breed;

  CatModel({
    required this.id,
    required this.name,
    required this.age,
    required this.breed,
  });

  factory CatModel.fromJson(Map<String, dynamic> json) => CatModel(
        id: json["id"],
        name: json["name"],
        age: json["age"],
        breed: json["breed"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "age": age,
        "breed": breed,
      };
}
