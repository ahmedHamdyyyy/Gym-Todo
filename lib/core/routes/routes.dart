import 'package:flutter/material.dart';

class Routes {
  Route routes(RouteSettings route) {
    /*  if (route.name == Constant.splashScreen) return _route(const SplashScreen());
    if (route.name == Constant.homeScreen) return _route(const HomeScreen());
    if (route.name == Constant.customerScreen) return _route(const CustomerScreen());
    */
    return _wrongRoute();
  }

  MaterialPageRoute _route(Widget route) =>
      MaterialPageRoute(builder: (context) => route);
  MaterialPageRoute _wrongRoute() =>
      _route(Scaffold(appBar: AppBar(title: const Text('wrong route'))));
}
