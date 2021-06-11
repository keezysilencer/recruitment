import 'package:dartz/dartz.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/platform/network_info.dart';
import '../../domain/entities/post.dart';
import '../../domain/repositories/post_repository.dart';
import '../database/post_remote_database.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDatabase remoteDatabase;
  final NetworkInfo networkInfo;

  PostRepositoryImpl({required this.remoteDatabase, required this.networkInfo});

  @override
  Future<Either<Failure, List<Post>>> postData() async {
    try {
      await networkInfo.hasInternet();
      final remotePost = await remoteDatabase.postDataRequest();
      return Right(remotePost);
    } on ServerException catch (error) {
      return Left(Failure(error.message));
    }
  }
}
