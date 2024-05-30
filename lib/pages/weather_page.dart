import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_two/color/color.dart';
import 'package:weather_two/entity/current_weather_entity.dart';
import 'package:weather_two/repository/current_weather_repository.dart';

class WeatherPage extends ConsumerWidget {
  const WeatherPage({super.key, required this.data});
  final CurrentWeatherEntity data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(children: [
        const SizedBox(
          height: 50,
        ),
        Text(
          'Condizione: ${data.description}',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        const SizedBox(
          height: 50,
        ),
        Text(
          'Temperatura: ${(data.temp - 273.15).round()}°',
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
        ),
        FilledButton(
            onPressed: () {
              ref.refresh(weatherRepositoryProvider).getCurrentWeather();
              ref.read(colorProvider.notifier).state = Colors.blue;
            },
            child: const Text('Aggiorna'))
      ]),
    );
  }
}
