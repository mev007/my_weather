import 'dart:convert';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/Weather/weather_json.dart';
import '../utils/Location.dart';
import '../utils/Constants.dart';

// api.openweathermap.org/data/2.5/forecast?lat={lat}&lon={lon}&appid={API key}
// api.openweathermap.org/data/2.5/forecast?lat=49.625380655650275&lon=34.516038114409135&appid=528d9cb34a7a57d56465d8952b15c364

// api.openweathermap.org/data/2.5/forecast?q={city name}&appid={API key}
// api.openweathermap.org/data/2.5/forecast?q=London&appid=528d9cb34a7a57d56465d8952b15c364

class NetworkManager {
  Future<WeatherJson> getWeatherByLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    final lang = Get.locale == Locale('en', 'US') ? 'en' : 'ua';
    final uri = Uri.https(WEATHER_URL_DOMAIN, WEATHER_URL_PATH, {
      'lat': location.lat.toString(),
      'lon': location.lon.toString(),
      'units': 'metric',
      'lang': lang,
      'appid': API_KEY,
    });
    final response =
        await http.get(uri).timeout(const Duration(seconds: 3), onTimeout: () {
      return _onTimeoutLoc();
    });
    return WeatherJson.fromJson(jsonDecode(response.body));
  }

  Future<WeatherJson> getWeatherByNameCity(String? city) async {
    final lang = Get.locale == Locale('en', 'US') ? 'en' : 'ua';
    final uri = Uri.https(WEATHER_URL_DOMAIN, WEATHER_URL_PATH, {
      'q': city,
      'units': 'metric',
      'lang': lang,
      'appid': API_KEY,
    });
    final response = await http.get(uri).timeout(const Duration(seconds: 3), onTimeout: () {
      return _onTimeoutCity();
    });
    return WeatherJson.fromJson(jsonDecode(response.body));
    
  }

  _onTimeoutLoc() {
    // codeError.value = 999;
    // messageError.value = 'Loc>>>> Time Out occurs';
    print(">>>Loc>>>> Time Out occurs");
    // update();
  }

  _onTimeoutCity() {
    // codeError.value = 999;
    // messageError.value = 'City>>>> Time Out occurs';
    print(">>>City>>>> Time Out occurs");
    // update();
  }
}