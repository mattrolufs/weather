import 'package:weather/data/datasources/meteo_weather_datascource.dart';
import 'package:weather/data/datasources/weather_datasource.dart';
import 'package:weather/data/repositories/weather_repository_impl.dart';
import 'package:weather/domain/repositories/weather_repository.dart';
import 'package:weather/domain/usecases/get_weather_usecase.dart';

class Injector {
  //Weather dependencies
  static WeatherDatasource weatherDatasource = MeteoWeatherDatasource();
  static WeatherRepository weatherRepository =
      WeatherRepositoryImpl(weatherDatasource: weatherDatasource);
  static GetWeatherUsecase getWeatherUsecase =
      GetWeatherUsecase(weatherRepository: weatherRepository);
}
