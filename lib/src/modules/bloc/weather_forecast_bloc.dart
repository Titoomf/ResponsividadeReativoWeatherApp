import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_responsivo/src/modules/bloc/state/weather_forecast_state.dart';
import 'package:weather_forecast_responsivo/src/modules/weatherforecast/model/weather_model.dart';
import 'package:weather_forecast_responsivo/src/modules/weatherforecast/repository/weather_forecast_repository.dart';

import 'event/search_weather_forecast_event.dart';

class WeatherForecastBloc extends Bloc<SearchCityEvent, SearchWeatherState> {
  WeatherRepository repository;
  WeatherModel? model;

  WeatherForecastBloc(
    this.repository,
    this.model,
  ) : super(SearchWeatherSucess()) {
    on<SearchCityEvent>(searchCity);
  }
  Future<void> searchCity(
      SearchCityEvent event, Emitter<SearchWeatherState> emit) async {
    emit(const SearchWeatherLoading());
    Future.delayed(const Duration(milliseconds: 500));
    try {
      final model = await repository.getWeattherForecast(event.city);
      emit(SearchWeatherSucess(model: model));
    } catch (e) {
      emit(SearchWeatherError(e.toString()));
    }
  }
}
