import 'package:either_dart/either.dart';
import 'package:flutter_weather_app_test/errors/errors.dart';
import 'package:flutter_weather_app_test/src/data/models/town_location_model.dart';
import 'package:flutter_weather_app_test/src/domain/entity/town_entity.dart';
import 'package:flutter_weather_app_test/src/domain/repository/weather_repository.dart';

// этот сервис даем данные о точках с погодой за 3 дня

class WeatherService {
  final WeatherRepository repositoryWeather;
  WeatherService(this.repositoryWeather);
  Future<Either<List<WeatherEntity>, WeatherError>> getWeatherInfo(
      TownLocationModel townLocate) async {
    final result = await repositoryWeather.getWeatherEntity(townLocate);
    return result;
  }
}
