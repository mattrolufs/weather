import 'package:weather/domain/entities/weather.dart';
import 'package:weather/domain/repositories/weather_repository.dart';
import 'package:weather/domain/usecases/base_usecase.dart';

class GetWeatherUsecase
    extends BaseUseCase<Future<Weather?>, GetWeatherParams> {
  GetWeatherUsecase({required this.weatherRepository});

  final WeatherRepository weatherRepository;

  @override
  Future<Weather?> execute(GetWeatherParams params) {
    return weatherRepository.getWeather(params.lat, params.long);
  }
}

class GetWeatherParams {
  GetWeatherParams({this.lat, this.long});

  final String? lat;
  final String? long;
}
