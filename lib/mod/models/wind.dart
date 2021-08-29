class Wind {
  double? speed;

  Wind({this.speed});

  @override
  String toString() => 'Wind(speed: $speed)';

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json['speed'] as double?,
      );

  Map<String, dynamic> toJson() => {
        'speed': speed,
      };

  Wind copyWith({
    double? speed,
  }) {
    return Wind(
      speed: speed ?? this.speed,
    );
  }
}
