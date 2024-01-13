import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather/domain/entities/weather.dart';
import 'package:weather/domain/usecases/get_weather_usecase.dart';
import 'package:weather/injector.dart';

part 'weather_notifier.g.dart';

// final loaderStateProvider = StateProvider<bool>((ref) => false);

// final weatherProvider = FutureProvider<Weather?>((ref, lat, long) =>
//     ref.read(weatherScreenViewModelProvider).getWeather(lat, long));

// final weatherScreenViewModelProvider =
//     Provider.autoDispose<WeatherScreenViewModel>(
//         (ref) => WeatherScreenViewModel(
//               ref,
//               getWeatherUsecase: Injector.getWeatherUsecase,
//             ));

// class WeatherScreenViewModel {
//   late ProviderRef ref;
//   late GetWeatherUsecase getWeatherUsecase;
//   static final WeatherScreenViewModel _singleton =
//       WeatherScreenViewModel._internal();

//   factory WeatherScreenViewModel(ProviderRef reference,
//       {required GetWeatherUsecase getWeatherUsecase}) {
//     _singleton.ref = reference;
//     _singleton.getWeatherUsecase = getWeatherUsecase;
//     return _singleton;
//   }

//   WeatherScreenViewModel._internal();

//   late Future<Weather?> weather;

final snapshotWeather = StateProvider<Weather?>((ref) {
  return null;
});

final location = StateProvider<String?>((ref) {
  return null;
});

@riverpod
Future<Weather?> getWeather(GetWeatherRef ref,
    {String? lat, String? long}) async {
  final weather = await Injector.getWeatherUsecase
      .execute(GetWeatherParams(lat: lat, long: long));

  ref.read(snapshotWeather.notifier).state = weather;

  return weather;
}
