class CurrentUnits {
  final String time;
  final String interval;
  final String temperature2M;
  final String relativeHumidity2M;
  final String apparentTemperature;
  final String isDay;
  final String precipitation;
  final String rain;
  final String showers;
  final String snowfall;
  final String weatherCode;
  final String cloudCover;
  final String pressureMsl;
  final String surfacePressure;
  final String windSpeed10M;
  final String windDirection10M;
  final String windGusts10M;

  CurrentUnits({
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
    required this.cloudCover,
    required this.pressureMsl,
    required this.surfacePressure,
    required this.windSpeed10M,
    required this.windDirection10M,
    required this.windGusts10M,
  });
}
