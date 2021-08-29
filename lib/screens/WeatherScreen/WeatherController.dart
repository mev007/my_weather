import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_weather/models/WeatherModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../network/NetworkManager.dart';
// import '../../models/Weather/weather_json.dart';

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
      // final sss = weather.value!.toJson();
      // final copyModel = WeatherModel.fromJson(sss);
      final copyModel = weather.value!.copyWith();
      copyModel.list?.removeRange(5, copyModel.list?.length ?? 0);
      await SharedPreferences.getInstance().then((saveWeather) {
        final jsonWeather = copyModel.toJson();
        String stringWeather = json.encode(jsonWeather);
        saveWeather.setString('weather', stringWeather);
      });
    }
  }

  Future<void> readWeather() async {
    await SharedPreferences.getInstance().then((itemWeather) {
      final readData = itemWeather.getString('weather') ?? '';
      // final json = WeatherModel.fromJson(readData);
      // weather.value = json;

      print('>>>@@@>>> $readData');
      final ddd = jsonDecode(readData);
      print('>>>ddd>>> $ddd');
      Map<String, dynamic> jsss = ddd;
      // final ddd = Map<String, dynamic>.from(jsss);
      weather.value = WeatherModel.fromJson(jsss);
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
      msgError.value = error.toString();
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

  ///Перевірка чи є Інтернет
  Future<bool> checkConnection() async {
        bool hasConnection;
        try {
            final result = await InternetAddress.lookup('google.com');
            if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
                hasConnection = true;
            } else {
                hasConnection = false;
            }
        } on SocketException catch(_) {
            hasConnection = false;
        }
        return hasConnection;
  }
}
