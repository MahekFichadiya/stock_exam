import 'package:get_it/get_it.dart';
import 'package:stock_management_exam/core/api/api_module.dart';
import 'package:stock_management_exam/data/remote/api_services.dart';
import 'package:stock_management_exam/data/repository/repository.dart';
import 'package:stock_management_exam/data/repository_implementation/repository_implementation.dart';
import 'package:stock_management_exam/router/app_router.dart';
import 'package:stock_management_exam/ui/auth/store/auth_store.dart';
import 'package:stock_management_exam/ui/home/store/stock_store.dart';

final GetIt locator = GetIt.instance;

void setUpLocator() async {
  locator.registerLazySingleton(() => AppRouter());
  await ApiModule.dioProvider();
  locator.registerLazySingleton<RepositoryImplementation>(() => RepositoryImplementation(apiServices: locator<ApiServices>()));
  locator.registerLazySingleton<AuthStore>(() => AuthStore(repository: locator<RepositoryImplementation>()));
  locator.registerLazySingleton<StockStore>(() => StockStore(repository: locator<RepositoryImplementation>()));
}
