import 'package:dartz/dartz.dart';
import 'package:obramax_frontend_test/src/features/create_cat/domain/repositories/create_cat_repository.dart';

import '../../data/models/listing_cat_model.dart';
import '../../data/models/post_cat_model.dart';

class CreateCatUseCase {
  CreateCatUseCase(this.repository);

  final CreateCatRepository repository;

  Future<Either<ListingCatModel, dynamic>> fetchAll() async {
    return await repository.fetchAll();
  }

  Future<Either<void, dynamic>> post(PostCatModel model) async {
    return await repository.post(model);
  }
}
