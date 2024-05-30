import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_two/color/color.dart';
import 'package:weather_two/entity/current_weather_entity.dart';
import 'package:weather_two/pages/weather_page.dart';
import 'package:weather_two/providers/weather_provider.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<CurrentWeatherEntity> weather = ref.watch(weatherProvider);

    return MaterialApp(
      home: Scaffold(
        backgroundColor: ref.watch(colorProvider),
        appBar: AppBar(title: const Text('Meteo')),
        body: Center(
          child: switch (weather) {
            AsyncData(:final value) => WeatherPage(data: value),
            AsyncError() => const Text('Oops, something unexpected happened'),
            _ => const CircularProgressIndicator(),
          },
        ),
      ),
    );
  }
}
