import 'package:flutter/material.dart';

import '../../../model/forecast_model.dart';
import '../searchBox/custom_searchBox.dart';
import '../textTemperature/custom_text_temperature.dart';
import '../widgetList/custom_widget_list.dart';

class CustomWeatherForcast extends StatefulWidget {
  final IconData icon;
  final void Function(String) onChanged;
  final void Function() onPressed;

  final Size size;
  final String city;
  final String temperature;
  final String description;
  final String wind;
  final int itemCount;
  final List<ForecastModel>? forecast;

  const CustomWeatherForcast({
    Key? key,
    required this.size,
    required this.city,
    required this.temperature,
    required this.description,
    required this.itemCount,
    required this.wind,
    required this.forecast,
    required this.onChanged,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  State<CustomWeatherForcast> createState() => _CustomWeatherForcastState();
}

class _CustomWeatherForcastState extends State<CustomWeatherForcast> {
  @override
  Widget build(BuildContext context) {
    // corpo da minha aplicacao  e como que ele vai se ajeitar dando na vertical como na horizontal
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return isPortrait
        ? SingleChildScrollView(
            child: Column(
              // espacamento dos icoce e text
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomSearchBox(
                  onPressed: widget.onPressed,
                  onChanged: widget.onChanged,
                  size: widget.size,
                ),
                CustomTextTemperature(
                  icon: widget.icon,
                  city: widget.city,
                  description: widget.description,
                  temperature: widget.temperature,
                ),
                CustomWidgetList(
                  wind: widget.wind,
                  forecast: widget.forecast,
                  itemCount: widget.itemCount,
                  description: widget.description,
                  temperature: widget.temperature,
                  height: widget.size.height * .20,
                  width: widget.size.width,
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          )
        : SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomSearchBox(
                  onPressed: widget.onPressed,
                  size: widget.size,
                  onChanged: widget.onChanged,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomTextTemperature(
                      icon: widget.icon,
                      city: widget.city,
                      description: widget.description,
                      temperature: widget.temperature,
                    ),
                    CustomWidgetList(
                      height: widget.size.height * .5,
                      width: widget.size.width * .5,
                      description: widget.description,
                      forecast: widget.forecast,
                      itemCount: widget.itemCount,
                      temperature: widget.temperature,
                      wind: widget.wind,
                    ),
                  ],
                ),
              ],
            ),
          );

    // return LayoutBuilder(
    //   builder: (context, constraints) {
    //     if (constraints.maxHeight > 500) {
    //       return Column(
    //         // espacamento dos icoce e text
    //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //         mainAxisSize: MainAxisSize.min,
    //         children: [
    //           CustomSearchBox(size: size),
    //           CustomTextTemperature(size: size),
    //           CustomWidgetList(
    //             height: size.height * .20,
    //             width: size.width,
    //           ),
    //         ],
    //       );
    //     } else {
  }
}
