import 'package:weather_two/dto/current_weather_dto.dart';
import 'package:weather_two/entity/current_weather_entity.dart';

class CurrentWeatherMapper {
  CurrentWeatherEntity toEntity(CurrentWeatherDTO dto) {

    return CurrentWeatherEntity(
        description: dto.weather![0].description!,
        temp: dto.main!.temp!,
        tempMin: dto.main!.tempMin!,
        tempMax: dto.main!.tempMax!,
        pressure: dto.main!.pressure!,
        humidity: dto.main!.humidity!
      );
  }
}
