// import 'dart:convert';

// import 'package:my_weather/utils/Constants.dart';

// class WeatherModel {
//   final String cod;
//   final String message;
//   final List<WeatherList> list;
//   final City city;
//   WeatherModel({
//     required this.cod,
//     required this.message,
//     required this.list,
//     required this.city,
//   });

//   WeatherModel copyWith({
//     String? cod,
//     String? message,
//     List<WeatherList>? list,
//     City? city,
//   }) {
//     return WeatherModel(
//       cod: cod ?? this.cod,
//       message: message ?? this.message,
//       list: list ?? this.list,
//       city: city ?? this.city,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'cod': cod,
//       'message': message,
//       'list': list.map((x) => x.toMap()).toList(),
//       'city': city.toMap(),
//     };
//   }

//   factory WeatherModel.fromMap(Map<String, dynamic> map) {
//     return WeatherModel(
//       cod: map['cod'],
//       message: map['message'].toString(),
//       list: List<WeatherList>.from(
//           map['list']?.map((x) => WeatherList.fromMap(x))),
//       city: City.fromMap(map['city']),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory WeatherModel.fromJson(String source) {
//     Map<String, dynamic> sss = json.decode(source);
//     return WeatherModel.fromMap(sss);
//   }

//   @override
//   String toString() {
//     return 'WeatherModel(cod: $cod, message: $message, list: $list, city: $city)';
//   }
// }

// class WeatherList {
//   final int dt;
//   final Main main;
//   final List<Weather> weather;
//   final Wind wind;
//   final String dt_txt;
//   WeatherList({
//     required this.dt,
//     required this.main,
//     required this.weather,
//     required this.wind,
//     required this.dt_txt,
//   });

  // WeatherList copyWith({
  //   int? dt,
  //   Main? main,
  //   List<Weather>? weather,
  //   Wind? wind,
  //   String? dt_txt,
  // }) {
  //   return WeatherList(
  //     dt: dt ?? this.dt,
  //     main: main ?? this.main,
  //     weather: weather ?? this.weather,
  //     wind: wind ?? this.wind,
  //     dt_txt: dt_txt ?? this.dt_txt,
  //   );
  // }

//   Map<String, dynamic> toMap() {
//     return {
//       'dt': dt,
//       'main': main.toMap(),
//       'weather': weather.map((x) => x.toMap()).toList(),
//       'wind': wind.toMap(),
//       'dt_txt': dt_txt,
//     };
//   }

//   factory WeatherList.fromMap(Map<String, dynamic> map) {
//     return WeatherList(
//       dt: map['dt']?.toInt(),
//       main: Main.fromMap(map['main']),
//       weather:
//           List<Weather>.from(map['weather']?.map((x) => Weather.fromMap(x))),
//       wind: Wind.fromMap(map['wind']),
//       dt_txt: map['dt_txt'],
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory WeatherList.fromJson(String source) =>
//       WeatherList.fromMap(json.decode(source));

//   @override
//   String toString() {
//     return 'WeatherList(dt: $dt, main: $main, weather: $weather, wind: $wind, dt_txt: $dt_txt)';
//   }

//   String getIconUrl() {
//     final nameImage = weather[0].icon;
//     return WEATHER_IMAGES_URL + nameImage + '.png';
//   }
// }

// class Main {
//   final double temp;
//   final double pressure;
//   final double humidity;
//   Main({
//     required this.temp,
//     required this.pressure,
//     required this.humidity,
//   });

  // Main copyWith({
  //   double? temp,
  //   double? pressure,
  //   double? humidity,
  // }) {
  //   return Main(
  //     temp: temp ?? this.temp,
  //     pressure: pressure ?? this.pressure,
  //     humidity: humidity ?? this.humidity,
  //   );
  // }

//   Map<String, dynamic> toMap() {
//     return {
//       'temp': temp,
//       'pressure': pressure,
//       'humidity': humidity,
//     };
//   }

//   factory Main.fromMap(Map<String, dynamic> map) {
//     return Main(
//       temp: map['temp']?.toDouble(),
//       pressure: map['pressure']?.toDouble(),
//       humidity: map['humidity']?.toDouble(),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Main.fromJson(String source) => Main.fromMap(json.decode(source));

//   @override
//   String toString() =>
//       'Main(temp: $temp, pressure: $pressure, humidity: $humidity)';
// }

// class Weather {
//   final String description;
//   final String icon;
//   Weather({
//     required this.description,
//     required this.icon,
//   });

  // Weather copyWith({
  //   String? description,
  //   String? icon,
  // }) {
  //   return Weather(
  //     description: description ?? this.description,
  //     icon: icon ?? this.icon,
  //   );
  // }

//   Map<String, dynamic> toMap() {
//     return {
//       'description': description,
//       'icon': icon,
//     };
//   }

//   factory Weather.fromMap(Map<String, dynamic> map) {
//     return Weather(
//       description: map['description'],
//       icon: map['icon'],
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Weather.fromJson(String source) =>
//       Weather.fromMap(json.decode(source));

//   @override
//   String toString() => 'Weather(description: $description, icon: $icon)';
// }

// class Wind {
//   final double speed;
//   Wind({
//     required this.speed,
//   });

//   Wind copyWith({
//     double? speed,
//   }) {
//     return Wind(
//       speed: speed ?? this.speed,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'speed': speed,
//     };
//   }

//   factory Wind.fromMap(Map<String, dynamic> map) {
//     return Wind(
//       speed: map['speed']?.toDouble(),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Wind.fromJson(String source) => Wind.fromMap(json.decode(source));

//   @override
//   String toString() => 'Wind(speed: $speed)';
// }

// class City {
//   final int id;
//   final String name;
//   final String country;
//   City({
//     required this.id,
//     required this.name,
//     required this.country,
//   });

//   City copyWith({
//     int? id,
//     String? name,
//     String? country,
//   }) {
//     return City(
//       id: id ?? this.id,
//       name: name ?? this.name,
//       country: country ?? this.country,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'name': name,
//       'country': country,
//     };
//   }

//   factory City.fromMap(Map<String, dynamic> map) {
//     return City(
//       id: map['id']?.toInt(),
//       name: map['name'],
//       country: map['country'],
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory City.fromJson(String source) => City.fromMap(json.decode(source));

//   @override
//   String toString() => 'City(id: $id, name: $name, country: $country)';
// }
