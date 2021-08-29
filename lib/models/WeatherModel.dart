import 'package:my_weather/utils/Constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'WeatherModel.g.dart';

@JsonSerializable()
class WeatherModel {
  final String cod;
  final String message;
  final List<WeatherList>? list;
  final City? city;
  WeatherModel(this.cod, this.message, {this.list, this.city});

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);

  @override
  String toString() {
    return 'WeatherModel(cod: $cod, message: $message, list: $list, city: $city)';
  }

  WeatherModel copyWith({
    String? cod,
    String? message,
    List<WeatherList>? list,
    City? city,
  }) {
    return WeatherModel(
      cod ?? this.cod,
      message ?? this.message,
      list: this.list != null ? this.list!.map((e) => e.copyWith()).toList() : null,
      city: this.city != null ? this.city!.copyWith() : null,
    );
  }
}

///WeatherList
@JsonSerializable(includeIfNull: false)
class WeatherList {
  final int dt;
  final Main main;
  final List<Weather> weather;
  final Wind wind;

  WeatherList(this.dt, this.main, this.weather, this.wind);

  factory WeatherList.fromJson(Map<String, dynamic> json) =>
      _$WeatherListFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherListToJson(this);

  @override
  String toString() {
    return 'WeatherList(dt: $dt, main: $main, weather: $weather, wind: $wind)';
  }

  WeatherList copyWith({
    int? dt,
    Main? main,
    List<Weather>? weather,
    Wind? wind,
  }) {
    return WeatherList(
      this.dt,
      this.main.copyWith(),
      this.weather.map((e) => e.copyWith()).toList(),
      this.wind.copyWith(),
    );
  }

  String? getIconUrl() {
    final nameImage = weather[0].icon;
    return nameImage == '' ? null : WEATHER_IMAGES_URL + nameImage + '.png';
  }
}

///Main
@JsonSerializable()
class Main {
  final double temp;
  final double pressure;
  final double humidity;

  Main(this.temp, this.pressure, this.humidity);

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
  Map<String, dynamic> toJson() => _$MainToJson(this);

  @override
  String toString() =>
      'Main(temp: $temp, pressure: $pressure, humidity: $humidity)';

  Main copyWith({
    double? temp,
    double? pressure,
    double? humidity,
  }) {
    return Main(
      temp ?? this.temp,
      pressure ?? this.pressure,
      humidity ?? this.humidity,
    );
  }
}

///Weather
@JsonSerializable()
class Weather {
  final String description;
  final String icon;
  Weather(this.description, this.icon);

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherToJson(this);

  @override
  String toString() => 'Weather(description: $description, icon: $icon)';

  Weather copyWith({
    String? description,
    String? icon,
  }) {
    return Weather(
      description ?? this.description,
      icon ?? this.icon,
    );
  }
}

///Wind
@JsonSerializable()
class Wind {
  final double speed;
  Wind(this.speed);

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);
  Map<String, dynamic> toJson() => _$WindToJson(this);

  @override
  String toString() => 'Wind(speed: $speed)';

  Wind copyWith({
    double? speed,
  }) {
    return Wind(
      speed ?? this.speed,
    );
  }
}

///City
@JsonSerializable()
class City {
  final int id;
  final String name;
  final String country;

  City(this.id, this.name, this.country);

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
  Map<String, dynamic> toJson() => _$CityToJson(this);

  @override
  String toString() => 'City(id: $id, name: $name, country: $country)';

  City copyWith({
    int? id,
    String? name,
    String? country,
  }) {
    return City(
      id ?? this.id,
      name ?? this.name,
      country ?? this.country,
    );
  }
}
