import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_weather_app_test/errors/errors.dart';
import 'package:flutter_weather_app_test/src/config/route/const/api_const.dart';
import 'package:flutter_weather_app_test/src/data/models/town_location_model.dart';

// здесь получаем координаты города
// поскольку они нам нужны для дальнейшего получения погоды
// по полученным точкам

// интерфейс нужен для того чтобы в случае замены Impl не пришлось
// все переделывать выше из-за этой замены ну для solid D

abstract class LocationDataSourse {
  Future<Either<TownLocationModel, LocationError>> getTownLocation(
      String nameTown);
}

class LocationDataSourseImpl implements LocationDataSourse {
  @override
  Future<Either<TownLocationModel, LocationError>> getTownLocation(
      String nameTown) async {
    final dio = Dio();
    final url = '$hhtpGeo$nameTown&appid=$keyAPI';

    try {
      final response = await dio.get(url);
      // приводим dynamic в формат для Darta
      final body = response.data as List<dynamic>;
      // проходим по каждому элементу и формируем модель
      final model = body.map((e) => TownLocationModel.fromMap(e));
      final result = model.first;

      return Left(result);
    } catch (error) {
      return Right(LocationError(message: error.toString()));
    }
  }
}
