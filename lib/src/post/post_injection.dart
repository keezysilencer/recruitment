import 'package:get_it/get_it.dart';

import 'data/database/post_remote_database.dart';
import 'data/repositories/post_repository_impl.dart';
import 'domain/repositories/post_repository.dart';
import 'domain/usecases/post_data.dart';
import 'presentation/bloc/post_bloc.dart';

void initPost() {
  final sl = GetIt.instance;
// bloc
  sl.registerFactory(() => PostBloc(sl()));
  //usecase
  sl.registerLazySingleton(() => PostData(sl()));

  // Repository
  sl.registerLazySingleton<PostRepository>(
      () => PostRepositoryImpl(remoteDatabase: sl(), networkInfo: sl()));

  // Database
  sl.registerLazySingleton<PostRemoteDatabase>(
      () => PostRemoteDatabaseImpl(sl()));
}
