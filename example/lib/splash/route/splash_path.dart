import 'package:dynamic_router/approuter.dart';
import 'package:approuter_example/routes/app_routes.dart';

class SplashPath extends PagePath {
  static const _location = Approutes.splashRoute;
  static const pagekey = Approutes.splashRoute;

  const SplashPath() : super(key: pagekey);

  @override
  String get location => _location;
}
