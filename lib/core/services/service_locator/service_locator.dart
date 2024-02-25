// ignore_for_file: depend_on_referenced_packages

import 'package:get_it/get_it.dart';
import 'package:gym/feature/cubit/customer_cubit.dart';

import '../../../feature/data/data.dart';
import '../../../feature/data/repository.dart';
import '../../error/error_handler.dart';

import '../cache/cache.dart';
import '../db/db.dart';

final locator = GetIt.instance;

void setApp() {
  locator.registerSingleton<DBServices>(DBServices());
  locator.registerSingleton<CacheServices>(CacheServices());
  locator.registerSingleton<ErrorHandler>(ErrorHandler());
  locator.registerSingleton<AppData>(
      AppData(locator<DBServices>(), locator<CacheServices>()));
  locator.registerSingleton<AppRepository>(AppRepository(locator<AppData>()));

  locator.registerSingleton<CustomerCubit>(CustomerCubit(
    locator<ErrorHandler>(),
    locator<AppRepository>(),
  ));
}
