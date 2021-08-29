class Main {
  double? temp;
  int? pressure;
  int? humidity;

  Main({this.temp, this.pressure, this.humidity});

  @override
  String toString() {
    return 'Main(temp: $temp, pressure: $pressure, humidity: $humidity)';
  }

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: json['temp'] as double?,
        pressure: json['pressure'] as int?,
        humidity: json['humidity'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'temp': temp,
        'pressure': pressure,
        'humidity': humidity,
      };

  Main copyWith({
    double? temp,
    int? pressure,
    int? humidity,
  }) {
    return Main(
      temp: temp ?? this.temp,
      pressure: pressure ?? this.pressure,
      humidity: humidity ?? this.humidity,
    );
  }
}
