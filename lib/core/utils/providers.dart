import 'package:eco_home/core/services/navigator_service.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/provider.dart';
import 'locator.dart';

class ProviderInjector {
  static List<SingleChildWidget> providers = [
    ..._independentServices,
    ..._dependentServices,
    ..._consumableServices,
  ];

  static List<SingleChildWidget> _independentServices = [
    Provider.value(value: locator<NavigatorService>()),
  ];

  static List<SingleChildWidget> _dependentServices = [];
  
  static List<SingleChildWidget> _consumableServices = [];
}