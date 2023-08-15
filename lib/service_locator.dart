import 'package:get_it/get_it.dart';
import 'package:obramax_frontend_test/src/core/service_locator/get_it_wrapper.dart';
import 'package:obramax_frontend_test/src/core/service_locator/service_locator_wrapper.dart';
import 'src/core/service_locator/service_locator_config.dart';
import 'src/features/create_cat/create_cat_service_locator.dart';

final GetIt sl = GetIt.instance;
final ServiceLocatorWrapper slWrapper = GetItWrapper(sl);

final List<ServiceLocatorModuleConfig> _modules = [];

final List<ServiceLocatorConfig> _features = [
  CreateCatServiceLocatorConfig(),
];

void setupLocator() {
  for (var serviceLocatorConfig in _features) {
    serviceLocatorConfig.configure(slWrapper);
  }

  for (var serviceLocatorConfig in _modules) {
    serviceLocatorConfig.setup(slWrapper);
  }
}
