import 'coord.dart';

class City {
  int? id;
  String? name;
  Coord? coord;
  String? country;
  int? population;
  int? timezone;
  int? sunrise;
  int? sunset;

  City({
    this.id,
    this.name,
    this.coord,
    this.country,
    this.population,
    this.timezone,
    this.sunrise,
    this.sunset,
  });
factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        coord: json["coord"] == null ? null : Coord.fromJson(json["coord"]),
        country: json["country"] == null ? null : json["country"],
        population: json["population"] == null ? null : json["population"],
        timezone: json["timezone"] == null ? null : json["timezone"],
        sunrise: json["sunrise"] == null ? null : json["sunrise"],
        sunset: json["sunset"] == null ? null : json["sunset"],
    );
  // factory City.fromJson(Map<String, dynamic> json) => City(
  //       id: json['id'] as int?,
  //       name: json['name'] as String?,
  //       coord: json['coord'] == null
  //           ? null
  //           : Coord.fromJson(json['coord'] as Map<String, dynamic>),
  //       country: json['country'] as String?,
  //       population: json['population'] as int?,
  //       timezone: json['timezone'] as int?,
  //       sunrise: json['sunrise'] as int?,
  //       sunset: json['sunset'] as int?,
  //     );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'coord': coord?.toJson(),
        'country': country,
        'population': population,
        'timezone': timezone,
        'sunrise': sunrise,
        'sunset': sunset,
      };
}
