import 'package:get_it/get_it.dart';
import 'package:referal/common_utils.dart';
import 'package:referal/functions.dart';
import 'package:shared_preferences/shared_preferences.dart';

final injection = GetIt.instance;

Future<void> configureDependencies() async {
  injection.registerLazySingleton<Functions>(() => Functions());
  injection.registerLazySingleton<CommonUtils>(() => CommonUtils());

  await injection.registerFactoryAsync(() => SharedPreferences.getInstance());
}
