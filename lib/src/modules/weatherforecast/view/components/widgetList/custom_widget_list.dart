import 'package:flutter/material.dart';

import '../../../model/forecast_model.dart';
import '../cards/custom_cards_weather.dart';

class CustomWidgetList extends StatelessWidget {
  final double height;
  final double width;
  final String temperature;
  final String description;
  final String wind;
  final int itemCount;
  final List<ForecastModel>? forecast;
  const CustomWidgetList({
    Key? key,
    required this.height,
    required this.width,
    required this.temperature,
    required this.description,
    required this.wind,
    required this.itemCount,
    required this.forecast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: Colors.black45,
      ),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        itemBuilder: (context, index) {
          ForecastModel weatherForecast;
          if (forecast == null) {
            weatherForecast = ForecastModel(
              day: '',
              temperature: '',
              wind: '',
            );
          } else {
            weatherForecast = forecast![index];
          }

          return CustomWeatherCard(
            height: height * 0.10,
            width: width * 0.30,
            day: weatherForecast.day,
            temperature: weatherForecast.temperature,
            wind: weatherForecast.wind,
          );
        },
      ),
    );
  }
}
