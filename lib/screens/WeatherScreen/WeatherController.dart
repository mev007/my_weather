import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_weather/models/WeatherModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../network/NetworkManager.dart';

class WeatherController extends GetxController {
  var weather = Rxn<WeatherModel>();
  var codeError = 0.obs;
  var messageError = ''.obs;
  var msgError = ''.obs;

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

  Future<void> saveWeather() async {
    if (weather.value != null && (weather.value?.list?.length ?? 0) > 0) {
      final copyWeather = WeatherModel.fromJson(weather.value!.toJson());
      copyWeather.list!.removeRange(3, copyWeather.list!.length - 1);
      await SharedPreferences.getInstance().then((saveWeather) {
        final jsonWeather = copyWeather.toJson();
        String stringWeather = jsonEncode(jsonWeather);
        saveWeather.setString('weather', stringWeather);
      });
    }
  }

  Future<void> readWeather() async {
    await SharedPreferences.getInstance().then((itemWeather) {
      Map<String, dynamic> json =
          jsonDecode(itemWeather.getString('weather') ?? '');
      weather.value = WeatherModel.fromJson(json);
      // update();
    });
  }

  Future<void> getWeatherByLocation() async {
    codeError.value = 0;
    msgError.value = '';
    messageError.value = '';
    weather = Rxn<WeatherModel>();
    update();
    weather.value =
        await NetworkManager().getWeatherByLocation().catchError((error) async {
      codeError.value = 888;
      msgError.value = '$error \n\n ${int.parse(weather.value?.cod ?? '0')}';
      await readWeather();
      update();
    });
    codeError.value = int.parse(weather.value?.cod ?? '0');
    messageError.value = weather.value?.message ?? 'Error';
    update();
    if (codeError.value == 200) {
      saveWeather();
    }
  }
  /*
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
    update();
  }
  */

  Future<void> getWeatherByNameCity(String city) async {
    codeError.value = 0;
    msgError.value = '';
    messageError.value = '';
    weather = Rxn<WeatherModel>();
    update();
    weather.value =
        await NetworkManager().getWeatherByNameCity(city).catchError((error) {
      codeError.value = 888;
      msgError.value = '$error \n\n ${int.parse(weather.value?.cod ?? '0')}';
      update();
      return null;
    });
    codeError.value = int.parse(weather.value?.cod ?? '0');
    messageError.value = weather.value?.message ?? 'Error';
    update();
  }

  // _onTimeoutLoc() {
  //   codeError.value = 999;
  //   messageError.value = 'Loc>>>> Time Out occurs';
  //   print("Loc>>>> Time Out occurs");
  //   update();
  // }

  // _onTimeoutCity() {
  //   codeError.value = 999;
  //   messageError.value = 'City>>>> Time Out occurs';
  //   print("City>>>> Time Out occurs");
  //   update();
  // }
}
