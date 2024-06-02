class CurrentWeatherEntity {
  final String description;
  final num temp;
  final num tempMin;
  final num tempMax;
  final num feelsLike;
  final num pressure;
  final num humidity;
  final num windSpeed;
  final String icon;

  const CurrentWeatherEntity({
    required this.description,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.windSpeed,
    required this.icon
  });

  CurrentWeatherEntity copyWith({
    String? description,
    num? temp,
    num? tempMin,
    num? tempMax,
    num? feelsLike,
    num? pressure,
    num? humidity,
    num? windSpeed,
    String? icon
  }) {
    return CurrentWeatherEntity(
      description: description ?? this.description,
      temp: temp ?? this.temp,
      tempMin: tempMin ?? this.tempMin,
      tempMax: tempMax ?? this.tempMax,
      feelsLike: feelsLike ?? this.feelsLike,
      pressure: pressure ?? this.pressure,
      humidity: humidity ?? this.humidity,
      windSpeed: windSpeed ?? this.windSpeed,
      icon: icon?? this.icon
    );
  }
}
