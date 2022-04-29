import '../model/weather_model.dart';
import '../services/datasource/interfaces/i_weather_datasource_interfaces.dart';

class WeatherRepository {
  final IWeatherDataSource dataSource;

  WeatherRepository(this.dataSource);

  Future<WeatherModel> getWeattherForecast(String city) async {
    try {
      Map<String, dynamic> result = await dataSource.getWeatherForecast(city);
      final weather = WeatherModel.fromMap(result);
      return weather;
    } catch (e) {
      rethrow;
    }
  }
}
