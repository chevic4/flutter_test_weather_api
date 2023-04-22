import 'package:flutter_weather_app_test/src/data/models/weather_model.dart';
import 'package:flutter_weather_app_test/src/domain/entity/town_entity.dart';

class MapperWeatherModeltoEntity {
  // сформируем сущности из точек данных по датам
  // для удобства дальнейшей работы
  // для этого будем пробигаться по каждому элементу листа
  // и формировать точку времени с данными
  // чтобы потом удобно было в domain слое работать

  static List<WeatherEntity> dataToEntity(WeatherDataModel dataModel) {
    List<WeatherEntity> entity = [];
    // пробегаем по всему листу и преобразуем его в нужный вид

    for (var index = 0; index < dataModel.time.length; index++) {
      WeatherEntity cache = WeatherEntity(
        dateTime: DateTime.parse(dataModel.time[index]),
        temperature_2m: dataModel.temperature_2m[index].toDouble(),
        relativehumidity_2m: dataModel.relativehumidity_2m[index],
        windspeed_10m: dataModel.windspeed_10m[index].toDouble(),
      );
      entity.add(cache);
    }
    return entity;
  }
}
