import 'package:dynamic_router/approuter.dart';
import 'package:dynamic_router_example/routes/app_routes.dart';

class HomePath extends PagePath {
  static const _location = Approutes.homeRoute;
  static const pagekey = Approutes.homeRoute;

  const HomePath() : super(key: pagekey);

  @override
  String get location => _location;
}
