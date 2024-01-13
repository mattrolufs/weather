import 'package:weather/data/models/weather_model.dart';

class Current {
  final String time;
  final int interval;
  final double temperature2M;
  final int relativeHumidity2M;
  final double apparentTemperature;
  final int isDay;
  final double precipitation;
  final double rain;
  final double showers;
  final double snowfall;
  final int weatherCode;
  final WeatherCodes weatherCodeSummary;
  final int cloudCover;
  final double pressureMsl;
  final double surfacePressure;
  final double windSpeed10M;
  final int windDirection10M;
  final double windGusts10M;

  Current({
    required this.time,
    required this.interval,
    required this.temperature2M,
    required this.relativeHumidity2M,
    required this.apparentTemperature,
    required this.isDay,
    required this.precipitation,
    required this.rain,
    required this.showers,
    required this.snowfall,
    required this.weatherCode,
    required this.weatherCodeSummary,
    required this.cloudCover,
    required this.pressureMsl,
    required this.surfacePressure,
    required this.windSpeed10M,
    required this.windDirection10M,
    required this.windGusts10M,
  });
}
