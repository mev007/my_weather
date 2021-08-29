class City {
  int? id;
  String? name;
  String? country;

  City({this.id, this.name, this.country});

  @override
  String toString() => 'City(id: $id, name: $name, country: $country)';

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json['id'] as int?,
        name: json['name'] as String?,
        country: json['country'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'country': country,
      };

  City copyWith({
    int? id,
    String? name,
    String? country,
  }) {
    return City(
      id: id ?? this.id,
      name: name ?? this.name,
      country: country ?? this.country,
    );
  }
}
