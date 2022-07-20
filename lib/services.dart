import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:weather_app/models.dart';

class dataServices {

  Future<WeatherResponse> getWeather(String city) async {
    //https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}

    final queryParameters = {
      'lat': city,
      'appid': '8e9686a82fd28f2c2f03fcd4ec2e4e84',
      'units' : 'imperial'
    };

    final uri = Uri.https(
        'https://api.openweathermap.org', '/data/2.5/weather', queryParameters);

    final response = await http.get(uri);

    print(response.body);
    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}
