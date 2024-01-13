import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:location_geocoder/location_geocoder.dart';
import 'package:weather/presentation/viewmodels/weather_notifier.dart';

class WeatherScreen extends ConsumerStatefulWidget {
  const WeatherScreen({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends ConsumerState<WeatherScreen> {
  String? _currentAddress;
  Position? _currentPosition;

  @override
  void initState() {
    super.initState();
    _getCurrentPosition();
  }

  TextEditingController controller = TextEditingController();

  final String _apiKey = "AIzaSyDF94zlO0mwF7yaafaNCsQT3v6w7Zt6IwU";
  late LocatitonGeocoder geocoder = LocatitonGeocoder(_apiKey);

  @override
  Widget build(BuildContext context) {
    final weatherSnapshot = ref.watch(snapshotWeather);
    final locationSnapshot = ref.watch(location);
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather Today"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 25),
            placesAutoCompleteTextField(),
            const SizedBox(height: 20),
            (weatherSnapshot != null)
                ? Column(
                    children: [
                      Text(
                          (locationSnapshot != null)
                              ? locationSnapshot.toString().split(',')[0]
                              : _currentAddress.toString().split(',')[0],
                          style: const TextStyle(fontSize: 40)),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              weatherSnapshot.current.temperature2M
                                  .round()
                                  .toString(),
                              style: const TextStyle(fontSize: 130)),
                          const Padding(
                            padding: EdgeInsets.only(top: 26.0),
                            child:
                                Text('\u2109', style: TextStyle(fontSize: 45)),
                          ),
                        ],
                      ),
                      Icon(weatherSnapshot.current.weatherCodeSummary.icon,
                          size: 100),
                      const SizedBox(height: 30),
                      Text(
                        weatherSnapshot.current.weatherCodeSummary.name,
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 15),
                      Text(
                          'Feels like: ${weatherSnapshot.current.apparentTemperature.round()}\u2109',
                          style: const TextStyle(fontSize: 25)),
                      Text(
                          'Humidity: ${weatherSnapshot.current.relativeHumidity2M.round()}%',
                          style: const TextStyle(fontSize: 25)),
                      Text(
                          'Wind Speed: ${weatherSnapshot.current.windSpeed10M.round()} mph',
                          style: const TextStyle(fontSize: 25)),
                      Text(
                          'Wind Gusts: ${weatherSnapshot.current.windGusts10M.round()} mph',
                          style: const TextStyle(fontSize: 25)),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  placesAutoCompleteTextField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GooglePlaceAutoCompleteTextField(
        textEditingController: controller,
        googleAPIKey: "AIzaSyDF94zlO0mwF7yaafaNCsQT3v6w7Zt6IwU",
        inputDecoration: const InputDecoration(
          hintText: "Search your location",
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
        debounceTime: 400,
        countries: const ["us"],
        isLatLngRequired: true,
        getPlaceDetailWithLatLng: (Prediction prediction) async {
          var address = await _getAddress(
              double.parse(prediction.lat!), double.parse(prediction.lng!));
          if (address != null) {
            ref.read(location.notifier).state = prediction.description;
            ref.watch(getWeatherProvider(
                lat: prediction.lat!, long: prediction.lng!));
          }
        },
        itemClick: (Prediction prediction) {
          controller.text = prediction.description ?? "";
          controller.selection = TextSelection.fromPosition(
              TextPosition(offset: prediction.description?.length ?? 0));
        },
        seperatedBuilder: const Divider(),
        containerHorizontalPadding: 10,
        itemBuilder: (context, index, Prediction prediction) {
          return Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                const Icon(Icons.location_on),
                const SizedBox(
                  width: 7,
                ),
                Expanded(child: Text(prediction.description ?? ""))
              ],
            ),
          );
        },
        isCrossBtnShown: true,
      ),
    );
  }

  ///converts `coordinates` to actual `address` using google map api
  Future<String?> _getAddress(double lat, double lon) async {
    try {
      final address =
          await geocoder.findAddressesFromCoordinates(Coordinates(lat, lon));
      return address.first.postalCode;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('SOMETING WENT WRONG\nDID YOU ADD API KEY '),
        ),
      );
      rethrow;
    }
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      _getAddressFromLatLng(_currentPosition!);
      ref.watch(getWeatherProvider(
          lat: position.latitude.toString(),
          long: position.longitude.toString()));
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
            '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
        ref.watch(location.notifier).state =
            place.subAdministrativeArea.toString();
        controller.text = place.subAdministrativeArea.toString();
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }
}
