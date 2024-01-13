import 'package:weather/data/datasources/weather_datasource.dart';
import 'package:weather/data/models/weather_model.dart';
import 'package:weather/domain/entities/weather.dart';

import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class MeteoWeatherDatasource implements WeatherDatasource {
  @override
  Future<Weather?> getWeather(String? lat, String? long) async {
    var url = Uri.https('api.open-meteo.com', '/v1/forecast', {
      'latitude': lat,
      'longitude': long,
      'temperature_unit': 'fahrenheit',
      'wind_speed_unit': 'mph',
      'current':
          'temperature_2m,relative_humidity_2m,apparent_temperature,is_day,precipitation,rain,showers,snowfall,weather_code,cloud_cover,pressure_msl,surface_pressure,wind_speed_10m,wind_direction_10m,wind_gusts_10m'
    });
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var json = convert.jsonDecode(response.body) as Map<String, dynamic>;
      WeatherModel weatherModel = WeatherModel.fromJson(json);
      return weatherModel.mapToEntity();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    return null;
  }
}
