class Weather {
  String? description;
  String? icon;

  Weather({this.description, this.icon});

  @override
  String toString() => 'Weather(description: $description, icon: $icon)';

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        description: json['description'] as String?,
        icon: json['icon'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'description': description,
        'icon': icon,
      };

  Weather copyWith({
    String? description,
    String? icon,
  }) {
    return Weather(
      description: description ?? this.description,
      icon: icon ?? this.icon,
    );
  }
}
