// To parse this JSON data, do
//
//     final postCatModel = postCatModelFromJson(jsonString);

import 'dart:convert';

PostCatModel postCatModelFromJson(String str) =>
    PostCatModel.fromJson(json.decode(str));

String postCatModelToJson(PostCatModel data) => json.encode(data.toJson());

class PostCatModel {
  final String name;
  final int age;
  final String breed;

  PostCatModel({
    required this.name,
    required this.age,
    required this.breed,
  });

  factory PostCatModel.fromJson(Map<String, dynamic> json) => PostCatModel(
        name: json["name"],
        age: json["age"],
        breed: json["breed"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "age": age,
        "breed": breed,
      };
}
