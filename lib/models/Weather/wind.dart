class Wind {
  double? speed;
  double? deg;
  double? gust;

  Wind({this.speed, this.deg, this.gust});

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json['speed'].toDouble(),
        deg: json['deg'].toDouble(),
        gust: json['gust'].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'speed': speed,
        'deg': deg,
        'gust': gust,
      };
}
