import 'package:dartz/dartz.dart';
import 'package:obramax_frontend_test/src/features/create_cat/data/datasources/create_cat_remote_data_source.dart';
import 'package:obramax_frontend_test/src/features/create_cat/data/models/post_cat_model.dart';
import 'package:obramax_frontend_test/src/features/create_cat/domain/repositories/create_cat_repository.dart';

import '../models/listing_cat_model.dart';

class CreateCatRepositoryImpl implements CreateCatRepository {
  CreateCatRepositoryImpl({
    required this.remoteDataSource,
  });

  final CreateCatRemoteDataSource remoteDataSource;

  @override
  Future<Either<ListingCatModel, Exception>> fetchAll() async {
    try {
      var response = await remoteDataSource.fetchAll();
      return Left<ListingCatModel, Exception>(response);
    } on dynamic catch (e) {
      return Right<ListingCatModel, Exception>(
          (e is Exception) ? e : Exception(e.toString()));
    }
  }

  @override
  Future<Either<void, Exception>> post(PostCatModel model) async {
    try {
      var response = await remoteDataSource.post(model);
      return Left<void, Exception>(response);
    } on dynamic catch (e) {
      return Right<void, Exception>(
          (e is Exception) ? e : Exception(e.toString()));
    }
  }
}
