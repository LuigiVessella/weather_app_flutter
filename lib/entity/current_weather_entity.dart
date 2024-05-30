class CurrentWeatherEntity {
  final String description;
  final num temp;
  final num tempMin;
  final num tempMax;
  final num pressure;
  final num humidity;

  const CurrentWeatherEntity({
    required this.description,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });

  CurrentWeatherEntity copyWith({
    String? description,
    num? temp,
    num? tempMin,
    num? tempMax,
    num? pressure,
    num? humidity,
  }) {
    return CurrentWeatherEntity(
      description: description ?? this.description,
      temp: temp ?? this.temp,
      tempMin: tempMin ?? this.tempMin,
      tempMax: tempMax ?? this.tempMax,
      pressure: pressure ?? this.pressure,
      humidity: humidity ?? this.humidity,
    );
  }
}
