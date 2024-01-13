import 'package:weather/data/datasources/weather_datasource.dart';
import 'package:weather/domain/entities/weather.dart';
import 'package:weather/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  WeatherRepositoryImpl({required this.weatherDatasource});

  final WeatherDatasource weatherDatasource;

  @override
  Future<Weather?> getWeather(String? lat, String? long) {
    return weatherDatasource.getWeather(lat, long);
  }
}
