import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../core/requester/core_requester.dart';
import '../models/listing_cat_model.dart';
import '../models/post_cat_model.dart';

abstract class CreateCatRemoteDataSource {
  Future<ListingCatModel> fetchAll();
  Future<void> post(PostCatModel model);
}

class CreateCatRemoteDataSourceImpl implements CreateCatRemoteDataSource {
  CreateCatRemoteDataSourceImpl(this.requester);

  final CoreRequesterInterface requester;

  @override
  Future<ListingCatModel> fetchAll() async {
    return await requester.fetch(
      url: '${dotenv.env['base_url']}/cats',
      fromJson: (value) => ListingCatModel.fromMap({'elements': value}),
    );
  }

  @override
  Future<void> post(PostCatModel model) async {
    return await requester.post(
      url: '${dotenv.env['base_url']}/cats',
      body: model.toJson(),
      fromJson: (value) => true,
    );
  }
}
