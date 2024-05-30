import 'package:http/http.dart' as http;

class CurrentWeatherService {
  final client = http.Client();
  Future<http.Response> getCurrentWeather() async {
    const String url = 'api.openweathermap.org';

    final params = {
      'lat': '41.3518',
      'lon': '14.3689',
      'appid': 'e8cff7ac36757b1ea60b460f036140df',
      'lang' : 'it'
    };

    var response = await client.get(Uri.https(url, 'data/2.5/weather', params),
        headers: {'Connection': 'keep-alive'});

    return response;
  }
}
