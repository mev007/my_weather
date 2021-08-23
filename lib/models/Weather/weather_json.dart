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

  // factory WeatherJson.fromJson(Map<String, dynamic> json) => WeatherJson(
  //       cod: json["cod"] == null ? null : json["cod"],
  //       message: json["message"] == null ? null : json["message"],
  //       cnt: json["cnt"] == null ? null : json["cnt"],
  //       list: json["list"] == null
  //           ? null
  //           : List<WeatherList>.from(
  //               json["list"].map((x) => WeatherList.fromJson(x))),
  //       city: json["city"] == null ? null : City.fromJson(json["city"]),
  //     );

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
