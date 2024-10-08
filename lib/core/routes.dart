import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:hospitalapp/presentaions/home/view/homescreen.dart';
import 'package:hospitalapp/presentaions/login/view/loginscreen.dart';
import 'package:hospitalapp/presentaions/signup/view/registerscreen.dart';
import 'package:hospitalapp/presentaions/splash/view/splashscreen.dart';


class Approute {
  static const String inital = '/splash';
  static List<GetPage> pages = [
    GetPage(
      name: inital,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: StringsRoute.login,
      page: () => Loginscreen(),
    ),
    GetPage(
      name: StringsRoute.home,
      page: () => Homescreen(),
    ),
    GetPage(
      name: StringsRoute.register,
      page: () => Registerscreen(),
    ),
  ];
}

class StringsRoute {
  static const String login = '/login';
  static const String home = '/home/';
   static const String register = '/register';
}
