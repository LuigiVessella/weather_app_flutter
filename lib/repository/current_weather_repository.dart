import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_two/dto/current_weather_dto.dart';
import 'package:weather_two/entity/current_weather_entity.dart';
import 'package:weather_two/mapper/current_weather_mapper.dart';
import 'package:weather_two/service/current_weatcher_service.dart';

part 'current_weather_repository.g.dart';

class CurrentWeatherRepository{

  final CurrentWeatherService httpService = CurrentWeatherService();
  final CurrentWeatherMapper mapper = CurrentWeatherMapper();


  Future<CurrentWeatherEntity> getCurrentWeather() async{
    print('aggiorno');
    final response = await httpService.getCurrentWeather();

    if(response.statusCode == 200 || response.statusCode == 201){
      print('aleee');
      return (CurrentWeatherMapper().toEntity(CurrentWeatherDTO.fromJson(jsonDecode(response.body))));
    }
    else {
      return Future.error('Error getting current weather');
    }
  }
  
}

@riverpod
CurrentWeatherRepository weatherRepository (WeatherRepositoryRef ref) {
  return CurrentWeatherRepository();
}