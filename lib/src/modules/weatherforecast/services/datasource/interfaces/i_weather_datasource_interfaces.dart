import 'package:dio/dio.dart';

abstract class IWeatherDataSource {
  Future<Map<String, dynamic>> getWeatherForecast(String city);
}

class WeatherDataSourceDio implements IWeatherDataSource {
  final Dio dio;

  WeatherDataSourceDio(this.dio);

  @override
  Future<Map<String, dynamic>> getWeatherForecast(String city) async {
    try {
      final response =
          await dio.get('https://goweather.herokuapp.com/weather/$city');
      return response.data;
    } on DioError {
      rethrow;
    }
  }
}


// class WeatherDataSourceDio implements IWeatherDataSource {
//   final Dio dio;

//   WeatherDataSourceDio(this.dio);
//   @override
//   Future<Map<String, dynamic>> getWeatherForecast(String city) async {
//     try {
//       final response =
//           await dio.get('https://goweather.herokuapp.com/weather/$city');
//       return response.data;
//     } on DioError catch (e) {
//       throw AppError(
//         mensage: e.error,
//       );
//     }
//   }
// }
