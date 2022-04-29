import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_forecast_responsivo/src/modules/bloc/event/search_weather_forecast_event.dart';
import 'package:weather_forecast_responsivo/src/modules/bloc/state/weather_forecast_state.dart';
import 'package:weather_forecast_responsivo/src/modules/bloc/weather_forecast_bloc.dart';

import '../../components/body/custom_body.dart';
import '../../components/stacks/custom_stack.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, WeatherForecastBloc> {
  final SearchCityEvent searchCityEvent = SearchCityEvent();

  @override
  void initState() {
    super.initState();
    bloc.add(SearchCityEvent());

    // changeStatusbar();
  }

  // changeStatusbar() {
  //   SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //       statusBarColor: Colors.blue, systemNavigationBarColor: Colors.blue));
  // }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;
    return Scaffold(
      body: BlocBuilder<WeatherForecastBloc, SearchWeatherState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is SearchWeatherLoading) {
            return Container(
              color: Colors.black45,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is SearchWeatherError) {
            return Center(
              child: Text(
                state.message.toString(),
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                ),
              ),
            );
          }
          final sucess = (state as SearchWeatherSucess);
          return CustomStack(
            image: sucess.getImagens(),
            child: CustomWeatherForcast(
              icon: sucess.getIcons(),
              onPressed: () => bloc.add(searchCityEvent),
              onChanged: (value) => searchCityEvent.city = value,
              forecast: sucess.model?.forecast,
              itemCount: sucess.model!.forecast.length,
              wind: sucess.model!.wind,
              city: searchCityEvent.city,
              description: sucess.model!.description,
              temperature: sucess.model!.temperature,
              size: size,
            ),
          );
        },
      ),
    );
  }
}
