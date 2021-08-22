import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../network/NetworkManager.dart';
import '../../models/Weather/weather_json.dart';

class WeatherController extends GetxController {
  var weather = Rxn<WeatherJson>();
  var codeError = 0.obs;
  var messageError = ''.obs;

  late TextEditingController dialogController;

  @override
  Future<void> onInit() async {
    dialogController = TextEditingController();
    await getWeatherByLocation();
    super.onInit();
  }

  @override
  void onClose() {
    dialogController.dispose();
    super.onClose();
  }

  Future<void> getWeatherByLocation() async {
    codeError.value = 0;
    update();
    weather.value = await NetworkManager()
        .getWeatherByLocation()
        .timeout(const Duration(seconds: 10), onTimeout: () {
      return _onTimeoutLoc();
    });
    codeError.value = int.parse(weather.value?.cod ?? '0');
    print('>>> code <<< ${codeError.value}');
    // messageError.value = weather.value?.message ?? 'Error';
    update();
  }

  Future<void> getWeatherByNameCity(String city) async {
    codeError.value = 0;
    update();
    weather.value = await NetworkManager()
        .getWeatherByNameCity(city)
        .timeout(const Duration(seconds: 3), onTimeout: () {
      return _onTimeoutCity();
    });
    codeError.value = int.parse(weather.value?.cod ?? '0');
    print('>>> >>>code<<< <<< ${codeError.value}');
    // messageError.value = weather.value?.message ?? 'Error';
    update();
  }

  _onTimeoutLoc() {
    codeError.value = 999;
    messageError.value = 'Loc>>>> Time Out occurs';
    print("Loc>>>> Time Out occurs");
    update();
  }

  _onTimeoutCity() {
    codeError.value = 999;
    messageError.value = 'City>>>> Time Out occurs';
    print("City>>>> Time Out occurs");
    update();
  }
}
