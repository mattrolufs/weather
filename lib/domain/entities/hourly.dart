class Hourly {
  final List<String> time;
  final List<double> temperature2M;
  final List<double> rain;
  final List<double> showers;
  final List<double> snowfall;
  final List<double> windSpeed10M;
  final List<double> windSpeed80M;
  final List<double> windSpeed120M;
  final List<double> windSpeed180M;
  final List<int> windDirection10M;
  final List<int> windDirection80M;
  final List<int> windDirection120M;
  final List<int> windDirection180M;
  final List<double> windGusts10M;
  final List<double> temperature80M;
  final List<double> temperature120M;
  final List<double> temperature180M;

  Hourly({
    required this.time,
    required this.temperature2M,
    required this.rain,
    required this.showers,
    required this.snowfall,
    required this.windSpeed10M,
    required this.windSpeed80M,
    required this.windSpeed120M,
    required this.windSpeed180M,
    required this.windDirection10M,
    required this.windDirection80M,
    required this.windDirection120M,
    required this.windDirection180M,
    required this.windGusts10M,
    required this.temperature80M,
    required this.temperature120M,
    required this.temperature180M,
  });
}
