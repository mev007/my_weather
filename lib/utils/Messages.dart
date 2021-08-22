import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'hello': 'Hello',
          'Weather App': 'Weather application',
          'BttLocation': 'Determine by location',
          'BttNameCity': 'Determine by city name',
          'DetailWeather': 'Detailed forecast',
          'pressure': 'mm of mercury',
          'wind': 'm/s',
          'time': 'Time',
          'Weather conditions': 'Weather conditions',
          'temp': 'Temperature, ℃',
          'humidity':'Humidity,%',
          'wind speed': 'Wind speed, m/s',
          'cancel': 'Cancel',
          'ok': 'Ok',
          'name': 'Name',
        },
        'ua_UA': {
          'hello': 'Привіт',
          'Weather App': 'Додаток погоди',
          'BttLocation': 'Визначити по локації',
          'BttNameCity': 'Визначити по назві міста',
          'DetailWeather': 'Детальний прогноз',
          'pressure': 'мм рт.ст.',
          'wind': 'м/с',
          'time': 'Час',
          'Weather conditions': 'Погодні умови',
          'temp': 'Температура, ℃',
          'humidity': 'Вологість, %',
          'wind speed': 'Шв.вітру, м/с',
          'cancel': 'Скасувати',
          'ok': 'Ok',
          'name': 'Назва',
        }
      };
}