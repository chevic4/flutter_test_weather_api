// вообщем сервис предложил платно подписаться
// чтобы посмотреть на три дня погоду(
// пришлось найти ему бесплатную замену
// https://api.openweathermap.org/data/3.0/onecall?lat=33.44&lon=-94.04&exclude=hourly,daily&appid=ef16858eb1fe90d507e5c9d7d249a9e1

// вот здесь
// https://open-meteo.com/en/docs
// начнём)

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_weather_app_test/errors/errors.dart';
import 'package:flutter_weather_app_test/src/data/models/town_location_model.dart';
import 'package:flutter_weather_app_test/src/data/models/weather_model.dart';

abstract class WeatherGetDataSourse {
  Future<Either<WeatherDataModel, WeatherError>> getWeatherData(
      TownLocationModel location);
}

// получим здесь данные о погоде в виде точек, каждая точка(момент времени)
// в которй содежатся данные о погоде в этот самый момент
// вообщем получим этих данных сразу на три дня и будем с ними работать
class WeatherGetDataSourseImpl implements WeatherGetDataSourse {
  @override
  // получим или данные или ошибку
  // поэтому чтобы или или обрабоать удобно использовать пакет Either

  Future<Either<WeatherDataModel, WeatherError>> getWeatherData(
      TownLocationModel location) async {
    // обратимся к dio для взаимодействия с сетью
    final dio = Dio();
    // создадим url для передачи в dio
    final url =
        'https://api.open-meteo.com/v1/forecast?latitude=${location.latitude.toStringAsFixed(2)}&longitude=${location.longitude.toStringAsFixed(2)}&hourly=temperature_2m,relativehumidity_2m,windspeed_10m&forecast_days=3';
    // отловим ошибки в случае их возникновения
    try {
      // получим responce и
      final response = await dio.get(url);
      // приведем его к виду, чтобы можно было обработать
      final model = response.data as Map<String, dynamic>;
      // создадим наш класс из json
      final result = WeatherDataModel.fromJson(model["hourly"]);
      // вернем результат для получения дальнейших команд
      return Left(result);
      // можем вернуть и ошибкуы
    } catch (error) {
      return Right(WeatherError());
    }
  }
}
