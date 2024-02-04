import 'package:authentication_repository/src/data_stream.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void models() {
  getIt.registerSingleton<UserStream>(UserStream());
}
