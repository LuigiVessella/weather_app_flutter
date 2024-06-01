import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_two/color/color.dart';
import 'package:weather_two/entity/current_weather_entity.dart';
import 'package:weather_two/repository/current_weather_repository.dart';
import 'package:lottie/lottie.dart';

class WeatherPage extends ConsumerWidget {
  const WeatherPage({super.key, required this.data});
  final CurrentWeatherEntity data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(children: [
        Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            // Define how the card's content should be clipped
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: IconButton(
                                    onPressed: () {
                                      ref
                                          .refresh(weatherRepositoryProvider)
                                          .getCurrentWeather();
                                      ref.read(colorProvider.notifier).state =
                                          Colors.white60;
                                    },
                                    icon: const Icon(Icons.update)))),
                        const Icon(Icons.location_pin),
                        const Text('Piedimonte Matese')
                      ],
                    ),
                    showLottie(data.description),
                    Text(
                      '${(data.temp - 273.15).round()}°',
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 75),
                    ),
                    Text(
                      data.description,
                      style: const TextStyle(
                          fontWeight: FontWeight.w300, fontSize: 20),
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('MIN: ${(data.tempMin - 273.15).round()}°'),
                        Text('MAX: ${(data.tempMax - 273.15).round()}°')
                      ],
                    ),
                    const SizedBox(
                      height: 110,
                    ),
                  ]),
            )),
        const Align(
            alignment: Alignment.center,
            child: Card(  
              child: SizedBox(width: 500, height: 100,),

            )),
      ]),
    );
  }

  LottieBuilder showLottie(String weatherDescription) {
    if (weatherDescription.contains('nubi')) {
      return Lottie.asset('lib/assets/lottie/cloudy_animation.json',
          width: 200, height: 200);
    } else if (weatherDescription.contains('sole')) {
      return Lottie.asset('lib/assets/lottie/sunny_animation.json');
    } else {
      return Lottie.asset('lib/assets/lottie/rainy_animation.json');
    }
  }
}
