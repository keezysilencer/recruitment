import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/post.dart';

/// Interacts with the [Post] entity
abstract class PostRepository {
  /// Retrieves post from database
  Future<Either<Failure, List<Post>>> postData();
}
