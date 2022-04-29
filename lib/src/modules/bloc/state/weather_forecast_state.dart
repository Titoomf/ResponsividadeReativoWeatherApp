import 'package:flutter/material.dart';
import 'package:weather_forecast_responsivo/src/modules/shared/weather_icons_icons.dart';
import 'package:weather_forecast_responsivo/src/modules/weatherforecast/model/weather_model.dart';

abstract class SearchWeatherState {}

class InitialWeatherState implements SearchWeatherState {}

class SearchWeatherSucess implements SearchWeatherState {
  final String city = 'Laguna';
  WeatherModel? model;

  SearchWeatherSucess({
    this.model = const WeatherModel(
      description: '',
      temperature: '',
      wind: '',
      forecast: [],
    ),
  });
  String getImagens() {
    if (model!.description == 'Sunny') {
      return 'assets/images/sunny.png';
    } else if (model!.description == 'Partly cloudy') {
      return 'assets/images/nublado.png';
    } else if (model!.description == 'Patchy rain possible') {
      return 'assets/images/clear.png';
    } else {
      return 'assets/images/chuva_leve.png';
    }
  }

  IconData getIcons() {
    if (model!.description == 'Sunny') {
      return WeatherIcons.sun;
    } else if (model!.description == 'Partly cloudy') {
      return WeatherIcons.cloudSun;
    } else if (model!.description == 'Patchy rain possible') {
      return WeatherIcons.drizzle;
    } else {
      return WeatherIcons.temperatire;
    }
  }
}

class SearchWeatherLoading implements SearchWeatherState {
  const SearchWeatherLoading();
}

class SearchWeatherError implements SearchWeatherState {
  final String message;

  SearchWeatherError(this.message);
}

class SearchIsEmpty implements SearchWeatherState {}
