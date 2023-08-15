// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';

import '../../data/models/listing_cat_model.dart';

class CreateCatDatabinding {
  final ListingCatModel list;
  final TextEditingController nameTextController;
  final TextEditingController ageTextController;

  const CreateCatDatabinding({
    required this.list,
    required this.nameTextController,
    required this.ageTextController,
  });

  factory CreateCatDatabinding.initial() {
    return CreateCatDatabinding(
      list: ListingCatModel(elements: []),
      nameTextController: TextEditingController(),
      ageTextController: TextEditingController(),
    );
  }

  CreateCatDatabinding copyWith({
    ListingCatModel? list,
    TextEditingController? nameTextController,
    TextEditingController? ageTextController,
  }) {
    return CreateCatDatabinding(
      list: list ?? this.list,
      nameTextController: nameTextController ?? this.nameTextController,
      ageTextController: ageTextController ?? this.ageTextController,
    );
  }
}
