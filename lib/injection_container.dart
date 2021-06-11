import 'package:get_it/get_it.dart';

import 'core/platform/network_info.dart';
import 'src/post/post_injection.dart';
import 'package:http/http.dart' as http;
final sl = GetIt.instance;

void init() {
  // Post Feature dependencies
  initPost();
  // Http package
  sl.registerLazySingleton(() => http.Client());
  // Network Package
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
}
