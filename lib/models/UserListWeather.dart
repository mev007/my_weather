class UserListWeather {
  final int? idRecord;
  final DateTime? date;
  final String? time;
  final String? icon;
  final String? description;
  final double? temp;
  final double? humidity;
  final double? speed;

  UserListWeather({
    required this.idRecord,
    required this.date,
    required this.time,
    required this.icon,
    required this.description,
    required this.temp,
    required this.humidity,
    required this.speed,
  });
}
