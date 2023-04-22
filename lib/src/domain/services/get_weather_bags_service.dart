import 'package:flutter_weather_app_test/src/domain/entity/day_entity.dart';
import 'package:flutter_weather_app_test/src/domain/entity/town_entity.dart';

// обработаем здесь общий список точек с погодой на 3 дня
// сформируем List<DayEntity>

class BagsService {
  DaysEntities getDaysList(List<WeatherEntity> entityWeather) {
    List<DayEntity> cache = [];

    // в зависимости от количества дней начнём
    // формировать списки отталкиваясь от мапы дат
    // если даты нет в листе то добавим его)
    // а если есть то добавим в время в day по индексу листа
    Map<int, int> daysIndex = {};
    daysIndex[0] = entityWeather.first.dateTime.day;
    // ходная точка изначально первая
    int couldDot = entityWeather.first.dateTime.day;
    double couldTempDot = entityWeather.first.temperature_2m;

    cache.add(DayEntity.createDay(entityWeather.first));
    int indexPutDay = 0;
    for (var index = 1; index < entityWeather.length; index++) {
      //сразу пробегаясь по списку ищем в каком числе самая холодная температура
      if (entityWeather[index].temperature_2m < couldTempDot) {
        couldTempDot = entityWeather[index].temperature_2m;
        couldDot = entityWeather[index].dateTime.day;
      }
      // смотрим есть точка в map
      if (daysIndex.containsValue(entityWeather[index].dateTime.day)) {
        // вычисляем индекс элемента мапы
        var indexMap = 0;
        for (var element in daysIndex.values) {
          if (entityWeather[index].dateTime.day == element) {
            indexPutDay = indexMap;
          } else {
            indexMap++;
          }
        }
        // и кладем по этому индексу данные в результ
        cache[indexPutDay].dayInfo.add(entityWeather[index]);
      } else {
        indexPutDay = daysIndex.length;

        // если точки нет то создаем для неё новый лист в результе
        cache.add(DayEntity.createDay(entityWeather[index]));

        // и добавим дату к мапе
        daysIndex[indexPutDay] = entityWeather[index].dateTime.day;
      }
    }
    // дни сформированы теперь возьмем индекс самого холодного
    var keyIndex = daysIndex.keys
        .firstWhere((k) => daysIndex[k] == couldDot, orElse: () => 0);
    // сформируем результат и вернем
    DaysEntities result =
        DaysEntities(listDays: cache, couldDayindex: keyIndex);
    return result;
  }
}
