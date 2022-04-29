import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'src/modules/bloc/weather_forecast_bloc.dart';
import 'src/modules/weatherforecast/model/weather_model.dart';
import 'src/modules/weatherforecast/repository/weather_forecast_repository.dart';
import 'src/modules/weatherforecast/services/datasource/interfaces/i_weather_datasource_interfaces.dart';
import 'src/modules/weatherforecast/view/pages/home/home_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => WeatherRepository(i())),
        Bind((i) => WeatherDataSourceDio(i())),
        Bind((i) => WeatherForecastBloc(i(), i())),
        Bind((i) => Dio()),
        Bind(
          (i) => const WeatherModel(
            temperature: '',
            wind: '',
            description: '',
            forecast: [],
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const HomePage(),
        ),
      ];
}
