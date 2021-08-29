import 'city.dart';
import 'lllist.dart';

class WeatherModels {
  String? cod;
  String? message;
  List<Lllist>? lllist;
  City? city;

  WeatherModels({this.cod, this.message, this.lllist, this.city});

  @override
  String toString() {
    return 'WeatherModels(cod: $cod, message: $message, lllist: $lllist, city: $city)';
  }

  factory WeatherModels.fromJson(Map<String, dynamic> json) => WeatherModels(
        cod: json['cod'] as String?,
        message: json['message'] as String?,
        lllist: (json['lllist'] as List<dynamic>?)
            ?.map((e) => Lllist.fromJson(e as Map<String, dynamic>))
            .toList(),
        city: json['city'] == null
            ? null
            : City.fromJson(json['city'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'cod': cod,
        'message': message,
        'lllist': lllist?.map((e) => e.toJson()).toList(),
        'city': city?.toJson(),
      };

  WeatherModels copyWith({
    String? cod,
    String? message,
    List<Lllist>? lllist,
    City? city,
  }) {
    return WeatherModels(
      cod: cod ?? this.cod,
      message: message ?? this.message,
      lllist: lllist ?? this.lllist,
      city: city ?? this.city,
    );
  }
}
