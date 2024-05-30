
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_two/entity/current_weather_entity.dart';
import 'package:weather_two/repository/current_weather_repository.dart';

part 'weather_provider.g.dart';

@riverpod
Future<CurrentWeatherEntity> weather (WeatherRef ref) {
  return ref
        .watch(weatherRepositoryProvider)
        .getCurrentWeather();
}