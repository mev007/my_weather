import 'city.dart';
import 'weather_list.dart';

class WeatherJson {
  String? cod;
  String? message;
  int? cnt;
  List<WeatherList>? list;
  City? city;

  WeatherJson({
    this.cod,
    this.message,
    this.cnt,
    this.list,
    this.city,
  });

  WeatherJson.fromJson(Map<String, dynamic> json) {
    city = json['city'] != null ? City.fromJson(json['city']) : null;
    cod = json['cod'];
    message = json['message'].toString();
    cnt = json['cnt'] as int?;
    if (json['list'] != null) {
      list = [];
      json['list'].forEach((v) {
        list?.add(WeatherList.fromJson(v));
      });
    }
  }

  // factory WeatherJson.fromJson(Map<String, dynamic> json) {
  //   return WeatherJson(
  //       cod: json['cod'] as String?,
  //       message: json['message'] as int?,
  //       cnt: json['cnt'] as int?,
  //       list: (json['list'] as List<dynamic>?)
  //           ?.map((e) => (e as List<dynamic>)
  //               .map((e) => WeatherList.fromJson(e as Map<String, dynamic>))
  //               .toList())
  //           .toList(),
  //       city: json['city'] == null
  //           ? null
  //           : City.fromJson(json['city'] as Map<String, dynamic>),
  //     );
  // }

  // Map<String, dynamic> toJson() => {
  //       'cod': cod,
  //       'message': message,
  //       'cnt': cnt,
  //       'list': list?.map((e) => e.map((e) => e.toJson()).toList()).toList(),
  //       'city': city?.toJson(),
  //     };
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['city'] = this.city;
    data['cod'] = this.cod;
    data['message'] = this.message;
    data['cnt'] = this.cnt;
    if (this.list != null) {
      data['list'] = this.list?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
