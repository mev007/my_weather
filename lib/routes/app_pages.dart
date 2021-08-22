import 'package:get/get.dart';
import '../screens/DetailScreen/DetailScreen.dart';
import '../screens/WeatherScreen/WeatherScreen.dart';

import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.WEATHER,
      page: () => WeatherScreen(),
      // binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.DETAIL_SCREEN,
      page: () => DetailScreen(),
    ),
  ];
}
