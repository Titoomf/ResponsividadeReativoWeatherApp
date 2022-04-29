abstract class WeatherForecastEvent {}

class SearchCityEvent implements WeatherForecastEvent {
  String city;
  SearchCityEvent({this.city = 'Laguna'});
}
