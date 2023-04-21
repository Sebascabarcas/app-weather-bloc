// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  Weather(
      {required this.description,
      required this.country,
      required this.name,
      required this.icon,
      required this.temp,
      required this.tempMin,
      required this.tempMax,
      required this.lastUpdated});

  final String description;
  final String country;
  final String name;
  final String icon;
  final double temp;
  final double tempMin;
  final double tempMax;
  final DateTime lastUpdated;

  factory Weather.fromJson(Map<String, dynamic> json) {
    final weather = json['weather'][0];
    final main = json['main'];

    print('fromJson');
    print(json);
    return Weather(
        description: weather['description'],
        country: '',
        name: '',
        icon: weather['icon'],
        temp: main['temp'],
        tempMin: main['temp_min'],
        tempMax: main['temp_max'],
        lastUpdated: DateTime.now());
  }

  factory Weather.initial() => Weather(
      description: '',
      country: '',
      name: '',
      icon: '',
      temp: 100.0,
      tempMin: 100.0,
      tempMax: 100.0,
      lastUpdated: DateTime(1970));

  @override
  List<Object?> get props =>
      [description, country, name, icon, temp, tempMin, tempMax, lastUpdated];

  @override
  bool get stringify => true;

  Weather copyWith({
    String? description,
    String? country,
    String? name,
    String? icon,
    double? temp,
    double? tempMin,
    double? tempMax,
    DateTime? lastUpdated,
  }) {
    return Weather(
      description: description ?? this.description,
      country: country ?? this.country,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      temp: temp ?? this.temp,
      tempMin: tempMin ?? this.tempMin,
      tempMax: tempMax ?? this.tempMax,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }
}
