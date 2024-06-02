import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
            child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.blue,
                    Colors.blue.shade200,
                  ],
                )),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Previsioni meteo',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w700),
                        ),
                        const Divider(
                          height: 40,
                          thickness: 0.5,
                          color: Colors.grey,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                                child: Align(
                                    alignment: Alignment.topLeft,
                                    child: IconButton(
                                        onPressed: () {
                                          ref
                                              .refresh(
                                                  weatherRepositoryProvider)
                                              .getCurrentWeather();
                                          ref
                                              .read(colorProvider.notifier)
                                              .state = Colors.white60;
                                        },
                                        icon: const Icon(Icons.update)))),
                            const Icon(Icons.location_pin),
                            const Text('Piedimonte Matese')
                          ],
                        ),
                        showLottie(data.icon),
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
                         const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(children: [
                              SvgPicture.asset(
                                'lib/assets/svg/min_temp.svg',
                                width: 35,
                                height: 35,
                              ),
                              Text('MIN: ${(data.tempMin - 273.15).round()}°'),
                            ]),
                            Column(children: [
                              SvgPicture.asset(
                                'lib/assets/svg/max_temp.svg',
                                width: 35,
                                height: 35,
                              ),
                             Text('MAX: ${(data.tempMax - 273.15).round()}°')
                            ]),
                           
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ]),
                ))),
        Align(
            alignment: Alignment.center,
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                // Define how the card's content should be clipped
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.blue,
                      Colors.blue.shade200,
                    ],
                  )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(children: [
                        SvgPicture.asset(
                          'lib/assets/svg/temp_icon.svg',
                          width: 35,
                          height: 35,
                        ),
                        Text('${(data.feelsLike - 273.15).round()}°')
                      ]),
                      Column(children: [
                        SvgPicture.asset(
                          'lib/assets/svg/humidity_icon.svg',
                          width: 35,
                          height: 35,
                        ),
                        Text('${data.humidity}%')
                      ]),
                      Column(children: [
                        SvgPicture.asset(
                          'lib/assets/svg/wind_icon.svg',
                          width: 35,
                          height: 35,
                        ),
                        Text('${(data.windSpeed * 3.6).round()}km/h')
                      ]),
                    ],
                  ),
                ))),
      ]),
    );
  }

  LottieBuilder showLottie(String weatherIcon) {
    if (weatherIcon == ('01d')) {
      return Lottie.asset('lib/assets/lottie/cloudy_animation.json',
          width: 200, height: 200);
    } else if (weatherIcon == ('02d')) {
      return Lottie.asset('lib/assets/lottie/02d_animation.json',
          width: 200, height: 200);
    } else if (weatherIcon == ('03d')) {
      return Lottie.asset('lib/assets/lottie/03d_animation.json',
          width: 200, height: 200);
    } else if (weatherIcon == ('04d')) {
      print('qui');
      return Lottie.asset('lib/assets/lottie/04d_animation.json',
          width: 200, height: 200);
    } else if (weatherIcon == ('09d')) {
      return Lottie.asset('lib/assets/lottie/09d_animation.json',
          width: 200, height: 200);
    } else if (weatherIcon == ('10d')) {
      return Lottie.asset('lib/assets/lottie/10d_animation.json',
          width: 200, height: 200);
    } else if (weatherIcon == ('11d')) {
      return Lottie.asset('lib/assets/lottie/11d_animation.json',
          width: 200, height: 200);
    } else if (weatherIcon == ('13d')) {
      return Lottie.asset('lib/assets/lottie/13d_animation.json',
          width: 200, height: 200);
    } else {
      return Lottie.asset('lib/assets/lottie/50d_animation.json',
          width: 200, height: 200);
    }
  }
}
