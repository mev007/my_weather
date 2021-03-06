// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WeatherModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) {
  return WeatherModel(
    json['cod'] as String,
    json['message'].toString(),
    list: (json['list'] as List<dynamic>?)
        ?.map((e) => WeatherList.fromJson(e as Map<String, dynamic>))
        .toList(),
    city: json['city'] == null
        ? null
        : City.fromJson(json['city'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$WeatherModelToJson(WeatherModel instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'message': instance.message,
      'list': instance.list,
      'city': instance.city,
    };

WeatherList _$WeatherListFromJson(Map<String, dynamic> json) {
  return WeatherList(
    json['dt'] as int,
    Main.fromJson(json['main'] as Map<String, dynamic>),
    (json['weather'] as List<dynamic>)
        .map((e) => Weather.fromJson(e as Map<String, dynamic>))
        .toList(),
    Wind.fromJson(json['wind'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$WeatherListToJson(WeatherList instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'main': instance.main,
      'weather': instance.weather,
      'wind': instance.wind,
    };

Main _$MainFromJson(Map<String, dynamic> json) {
  return Main(
    (json['temp'] as num).toDouble(),
    (json['pressure'] as num).toDouble(),
    (json['humidity'] as num).toDouble(),
  );
}

Map<String, dynamic> _$MainToJson(Main instance) => <String, dynamic>{
      'temp': instance.temp,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
    };

Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return Weather(
    json['description'] as String,
    json['icon'] as String,
  );
}

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'description': instance.description,
      'icon': instance.icon,
    };

Wind _$WindFromJson(Map<String, dynamic> json) {
  return Wind(
    (json['speed'] as num).toDouble(),
  );
}

Map<String, dynamic> _$WindToJson(Wind instance) => <String, dynamic>{
      'speed': instance.speed,
    };

City _$CityFromJson(Map<String, dynamic> json) {
  return City(
    json['id'] as int,
    json['name'] as String,
    json['country'] as String,
  );
}

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'country': instance.country,
    };
