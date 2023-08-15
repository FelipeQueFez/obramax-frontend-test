import 'package:dartz/dartz.dart';

import '../../data/models/listing_cat_model.dart';
import '../../data/models/post_cat_model.dart';

abstract class CreateCatRepository {
  Future<Either<ListingCatModel, Exception>> fetchAll();
  Future<Either<void, Exception>> post(PostCatModel model);
}
