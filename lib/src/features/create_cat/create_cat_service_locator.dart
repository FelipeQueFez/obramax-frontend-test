import 'package:obramax_frontend_test/src/core/requester/core_requester.dart';
import 'package:obramax_frontend_test/src/features/create_cat/data/datasources/create_cat_remote_data_source.dart';
import 'package:obramax_frontend_test/src/features/create_cat/data/repositories/create_cat_repository_impl.dart';
import 'package:obramax_frontend_test/src/features/create_cat/domain/repositories/create_cat_repository.dart';
import 'package:obramax_frontend_test/src/features/create_cat/domain/usecases/create_cat_use_case.dart';
import 'package:obramax_frontend_test/src/features/create_cat/presentation/stores/create_cat_store.dart';

import '../../core/service_locator/service_locator_config.dart';
import '../../core/service_locator/service_locator_wrapper.dart';

class CreateCatServiceLocatorConfig
    implements ServiceLocatorConfigInternals, ServiceLocatorConfig {
  @override
  Future<void> configure(ServiceLocatorWrapper sl) async {
    registerManagerState(sl);
    registerUseCases(sl);
    registerRepositories(sl);
    registerDataSources(sl);
    registerServices(sl);
  }

  @override
  void registerManagerState(ServiceLocatorWrapper sl) {
    sl.registerFactory(() => CreateCatStore());
  }

  @override
  void registerDataSources(ServiceLocatorWrapper sl) {
    sl.registerLazySingleton<CreateCatRemoteDataSource>(
        () => CreateCatRemoteDataSourceImpl(CoreRequester()));
  }

  @override
  void registerRepositories(ServiceLocatorWrapper sl) {
    sl.registerLazySingleton<CreateCatRepository>(() => CreateCatRepositoryImpl(
        remoteDataSource: sl<CreateCatRemoteDataSource>()));
  }

  @override
  void registerUseCases(ServiceLocatorWrapper sl) {
    sl.registerFactory(() => CreateCatUseCase(sl<CreateCatRepository>()));
  }

  @override
  void registerServices(ServiceLocatorWrapper sl) {}
}
