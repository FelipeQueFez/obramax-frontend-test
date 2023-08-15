import 'dart:convert';
import 'package:obramax_frontend_test/src/features/create_cat/data/models/cat_model.dart';

class ListingCatModel {
  final List<CatModel> elements;
  ListingCatModel({
    required this.elements,
  });

  factory ListingCatModel.fromMap(Map<String, dynamic> map) {
    return ListingCatModel(
      elements: List<CatModel>.from(
        (map['elements'] as List).map<CatModel>(
          (x) => CatModel.fromJson(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
