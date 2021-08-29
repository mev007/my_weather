import 'main.dart';
import 'weather.dart';
import 'wind.dart';

class Lllist {
  int? dt;
  Main? main;
  List<Weather>? weather;
  Wind? wind;
  String? dtTxt;

  Lllist({this.dt, this.main, this.weather, this.wind, this.dtTxt});

  @override
  String toString() {
    return 'Lllist(dt: $dt, main: $main, weather: $weather, wind: $wind, dtTxt: $dtTxt)';
  }

  factory Lllist.fromJson(Map<String, dynamic> json) => Lllist(
        dt: json['dt'] as int?,
        main: json['main'] == null
            ? null
            : Main.fromJson(json['main'] as Map<String, dynamic>),
        weather: (json['weather'] as List<dynamic>?)
            ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
            .toList(),
        wind: json['wind'] == null
            ? null
            : Wind.fromJson(json['wind'] as Map<String, dynamic>),
        dtTxt: json['dt_txt'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'dt': dt,
        'main': main?.toJson(),
        'weather': weather?.map((e) => e.toJson()).toList(),
        'wind': wind?.toJson(),
        'dt_txt': dtTxt,
      };

  Lllist copyWith({
    int? dt,
    Main? main,
    List<Weather>? weather,
    Wind? wind,
    String? dtTxt,
  }) {
    return Lllist(
      dt: dt ?? this.dt,
      main: main ?? this.main,
      weather: weather ?? this.weather,
      wind: wind ?? this.wind,
      dtTxt: dtTxt ?? this.dtTxt,
    );
  }
}
