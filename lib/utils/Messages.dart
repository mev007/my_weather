import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'hello': 'Hello',
          'Weather App': 'Weather application',
          'BttLocation': 'Search by location',
          'BttNameCity': 'Search by city name',
          'DetailWeather': 'Detailed forecast',
          'pressure': 'mm of mercury',
          'wind': 'm/s',
          'time': 'Time',
          'Weather conditions': 'Weather conditions',
          'temp': 'Temperature, ℃',
          'humidity': 'Humidity,%',
          'wind speed': 'Wind speed, m/s',
          'cancel': 'Cancel',
          'ok': 'Ok',
          'name': 'Name',
          'Enter the city name': 'Enter the city name',
          'noInternet': 'No Internet',
          'noInternet_message':
              'No connect: "api.openweathermap.org"\nData is downloaded from the cache',
        },
        'ua_UA': {
          'hello': 'Привіт',
          'Weather App': 'Додаток погоди',
          'BttLocation': 'Пошук по локації',
          'BttNameCity': 'Пошук по назві міста',
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
          'Enter the city name': 'Введіть назву міста',
          'noInternet': 'Інтернету немає',
          'noInternet_message':
              'Немає з\'єднання: "api.openweathermap.org"\nДані завантажуються з кешу',
        }
      };
}
