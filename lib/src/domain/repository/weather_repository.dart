import 'package:either_dart/either.dart';
import 'package:flutter_weather_app_test/errors/errors.dart';
import 'package:flutter_weather_app_test/src/data/models/town_location_model.dart';
import 'package:flutter_weather_app_test/src/domain/entity/town_entity.dart';

// интерфейс для взаимодействия с Data слоем
// такой конечно же нужен и для получения локации
// но чтоб не нагромождать лишним кодом сделал для примера этот класс
//  2масштабировать" локацию я domain/service решил остановить

abstract class WeatherRepository {
  Future<Either<List<WeatherEntity>, WeatherError>> getWeatherEntity(
      TownLocationModel tow);
}
