import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather/data/models/data_mapper.dart';
import 'package:weather/domain/entities/current.dart';
import 'package:weather/domain/entities/current_units.dart';
import 'package:weather/domain/entities/weather.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherModel implements DataMapper<Weather> {
  final double latitude;
  final double longitude;
  final double generationtimeMs;
  final int utcOffsetSeconds;
  final String timezone;
  final String timezoneAbbreviation;
  final double elevation;
  final CurrentUnitsModel currentUnits;
  final CurrentModel current;

  WeatherModel({
    required this.latitude,
    required this.longitude,
    required this.generationtimeMs,
    required this.utcOffsetSeconds,
    required this.timezone,
    required this.timezoneAbbreviation,
    required this.elevation,
    required this.currentUnits,
    required this.current,
  });

  factory WeatherModel.fromRawJson(String str) =>
      WeatherModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        generationtimeMs: json["generationtime_ms"]?.toDouble(),
        utcOffsetSeconds: json["utc_offset_seconds"],
        timezone: json["timezone"],
        timezoneAbbreviation: json["timezone_abbreviation"],
        elevation: json["elevation"],
        currentUnits: CurrentUnitsModel.fromJson(json["current_units"]),
        current: CurrentModel.fromJson(json["current"]),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "generationtime_ms": generationtimeMs,
        "utc_offset_seconds": utcOffsetSeconds,
        "timezone": timezone,
        "timezone_abbreviation": timezoneAbbreviation,
        "elevation": elevation,
        "current_units": currentUnits.toJson(),
        "current": current.toJson(),
      };

  @override
  Weather mapToEntity() {
    return Weather(
      latitude: latitude,
      longitude: longitude,
      generationtimeMs: generationtimeMs,
      utcOffsetSeconds: utcOffsetSeconds,
      timezone: timezone,
      timezoneAbbreviation: timezoneAbbreviation,
      elevation: elevation,
      currentUnits: currentUnits.mapToEntity(),
      current: current.mapToEntity(),
    );
  }
}

class CurrentModel implements DataMapper<Current> {
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
  final int cloudCover;
  final double pressureMsl;
  final double surfacePressure;
  final double windSpeed10M;
  final int windDirection10M;
  final double windGusts10M;

  CurrentModel({
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

  factory CurrentModel.fromRawJson(String str) =>
      CurrentModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CurrentModel.fromJson(Map<String, dynamic> json) => CurrentModel(
        time: json["time"],
        interval: json["interval"],
        temperature2M: json["temperature_2m"]?.toDouble(),
        relativeHumidity2M: json["relative_humidity_2m"],
        apparentTemperature: json["apparent_temperature"]?.toDouble(),
        isDay: json["is_day"],
        precipitation: json["precipitation"],
        rain: json["rain"],
        showers: json["showers"],
        snowfall: json["snowfall"],
        weatherCode: json["weather_code"],
        cloudCover: json["cloud_cover"],
        pressureMsl: json["pressure_msl"]?.toDouble(),
        surfacePressure: json["surface_pressure"]?.toDouble(),
        windSpeed10M: json["wind_speed_10m"]?.toDouble(),
        windDirection10M: json["wind_direction_10m"],
        windGusts10M: json["wind_gusts_10m"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "interval": interval,
        "temperature_2m": temperature2M,
        "relative_humidity_2m": relativeHumidity2M,
        "apparent_temperature": apparentTemperature,
        "is_day": isDay,
        "precipitation": precipitation,
        "rain": rain,
        "showers": showers,
        "snowfall": snowfall,
        "weather_code": weatherCode,
        "cloud_cover": cloudCover,
        "pressure_msl": pressureMsl,
        "surface_pressure": surfacePressure,
        "wind_speed_10m": windSpeed10M,
        "wind_direction_10m": windDirection10M,
        "wind_gusts_10m": windGusts10M,
      };

  @override
  Current mapToEntity() {
    return Current(
      time: time,
      interval: interval,
      temperature2M: temperature2M,
      relativeHumidity2M: relativeHumidity2M,
      apparentTemperature: apparentTemperature,
      isDay: isDay,
      precipitation: precipitation,
      rain: rain,
      showers: showers,
      snowfall: snowfall,
      weatherCode: weatherCode,
      weatherCodeSummary: WeatherCodes.values
          .firstWhere((element) => element.id == weatherCode.toString()),
      cloudCover: cloudCover,
      pressureMsl: pressureMsl,
      surfacePressure: surfacePressure,
      windSpeed10M: windSpeed10M,
      windDirection10M: windDirection10M,
      windGusts10M: windGusts10M,
    );
  }
}

class CurrentUnitsModel implements DataMapper<CurrentUnits> {
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

  CurrentUnitsModel({
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

  factory CurrentUnitsModel.fromRawJson(String str) =>
      CurrentUnitsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CurrentUnitsModel.fromJson(Map<String, dynamic> json) =>
      CurrentUnitsModel(
        time: json["time"],
        interval: json["interval"],
        temperature2M: json["temperature_2m"],
        relativeHumidity2M: json["relative_humidity_2m"],
        apparentTemperature: json["apparent_temperature"],
        isDay: json["is_day"],
        precipitation: json["precipitation"],
        rain: json["rain"],
        showers: json["showers"],
        snowfall: json["snowfall"],
        weatherCode: json["weather_code"],
        cloudCover: json["cloud_cover"],
        pressureMsl: json["pressure_msl"],
        surfacePressure: json["surface_pressure"],
        windSpeed10M: json["wind_speed_10m"],
        windDirection10M: json["wind_direction_10m"],
        windGusts10M: json["wind_gusts_10m"],
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "interval": interval,
        "temperature_2m": temperature2M,
        "relative_humidity_2m": relativeHumidity2M,
        "apparent_temperature": apparentTemperature,
        "is_day": isDay,
        "precipitation": precipitation,
        "rain": rain,
        "showers": showers,
        "snowfall": snowfall,
        "weather_code": weatherCode,
        "cloud_cover": cloudCover,
        "pressure_msl": pressureMsl,
        "surface_pressure": surfacePressure,
        "wind_speed_10m": windSpeed10M,
        "wind_direction_10m": windDirection10M,
        "wind_gusts_10m": windGusts10M,
      };

  @override
  CurrentUnits mapToEntity() {
    return CurrentUnits(
      time: time,
      interval: interval,
      temperature2M: temperature2M,
      relativeHumidity2M: relativeHumidity2M,
      apparentTemperature: apparentTemperature,
      isDay: isDay,
      precipitation: precipitation,
      rain: rain,
      showers: showers,
      snowfall: snowfall,
      weatherCode: weatherCode,
      cloudCover: cloudCover,
      pressureMsl: pressureMsl,
      surfacePressure: surfacePressure,
      windSpeed10M: windSpeed10M,
      windDirection10M: windDirection10M,
      windGusts10M: windGusts10M,
    );
  }
}

enum WeatherCodes {
  clearsky('0', 'Clear sky', WeatherIcons.day_sunny),
  mainlyclear('1', 'Mainly clear', WeatherIcons.day_sunny),
  partlycloudy('2', 'Partly cloudy', WeatherIcons.day_cloudy),
  overcast('3', 'Overcast', WeatherIcons.day_sunny_overcast),
  fog('45', 'Fog', WeatherIcons.fog),
  rimefog('48', 'Depositing rime fog', WeatherIcons.day_fog),
  lightdrizzle('51', 'Light drizzle', WeatherIcons.day_rain),
  moderatedrizzle('53', 'Moderate drizzle', WeatherIcons.rain),
  densedrizzle('55', 'Dense drizzle', WeatherIcons.rain),
  freezingdrizzlelight('56', 'Light freezing drizzle', WeatherIcons.day_sleet),
  freezingdrizzledense(
      '57', 'Dense freezing drizzle', WeatherIcons.day_sleet_storm),
  slightrain('61', 'Slight rain', WeatherIcons.sprinkle),
  moderaterain('63', 'Moderate rain', WeatherIcons.raindrops),
  heavyrain('65', 'Heavy rain', WeatherIcons.raindrop),
  freezingrainlight('66', 'Light freezing rain', WeatherIcons.day_sleet),
  freezingdrizzleheavy(
      '67', 'Heavy freezing rain', WeatherIcons.day_sleet_storm),
  snowfallslight('71', 'Slight snow fall', WeatherIcons.snow),
  snowfallsmoderate('73', 'Moderate snow fall', WeatherIcons.snow),
  snowfallheavy('75', 'Heavy snow fall', WeatherIcons.snow),
  snowgrains('77', 'Snow grains', WeatherIcons.snow),
  rainshowersslight('80', 'Slight rain showers', WeatherIcons.storm_showers),
  rainshowerssmoderate(
      '81', 'Moderate rain showers', WeatherIcons.storm_showers),
  rainshowerssviolent('82', 'Violent rain showers', WeatherIcons.storm_showers),
  snowshowersslight('85', 'Slight snow showers', WeatherIcons.snow),
  snowshowersheavy('86', 'Moderate snow showers', WeatherIcons.snow),
  thunderstormslight(
      '95', 'Slight or moderate thunderstorms', WeatherIcons.storm_showers),
  thunderstormhailslight(
      '96', 'Thunderstorms with slight hail', WeatherIcons.thunderstorm),
  thunderstormhailsheavy(
      '99', 'Thunderstorms with heavy hail', WeatherIcons.thunderstorm);

  const WeatherCodes(this.id, this.name, this.icon);

  final String id;
  final String name;
  final IconData icon;

  @override
  String toString() => '$name: $id';
}
