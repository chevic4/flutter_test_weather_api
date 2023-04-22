import 'package:either_dart/either.dart';
import 'package:flutter_weather_app_test/errors/errors.dart';
import 'package:flutter_weather_app_test/src/data/data_source/weather_get_impl.dart';
import 'package:flutter_weather_app_test/src/data/mapper/tomn_to_entity.dart';
import 'package:flutter_weather_app_test/src/data/models/town_location_model.dart';
import 'package:flutter_weather_app_test/src/domain/entity/town_entity.dart';
import 'package:flutter_weather_app_test/src/domain/repository/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
// я не стал передавать все в approutes чтоб не перегружать
// его вид, а создал weatherGetDataSourse осознанно здесь
// соответственно не буду делать интерфейс для datasource

  final weatherGetDataSourse = WeatherGetDataSourseImpl();

  @override
  Future<Either<List<WeatherEntity>, WeatherError>> getWeatherEntity(
      TownLocationModel town) async {
    final dataFromSource = await weatherGetDataSourse.getWeatherData(town);
    if (dataFromSource.isLeft) {
      final dataModel = dataFromSource.left;
      final entityModel = MapperWeatherModeltoEntity.dataToEntity(dataModel);
      return Left(entityModel);
    } else {
      return Right(WeatherError());
    }
  }
}
