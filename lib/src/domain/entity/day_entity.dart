// содержит информацию о погоде в сутках по листам
// одни сутки - в одном листе

import 'package:flutter_weather_app_test/src/domain/entity/town_entity.dart';

// каждый  DayEntity это отдельный день с точкми о погоде за сутки

class DayEntity {
  List<WeatherEntity> dayInfo;
  DayEntity({
    required this.dayInfo,
  });

  void addWeatherEntity(WeatherEntity value) => dayInfo.add(value);

  factory DayEntity.createDay(WeatherEntity value) {
    List<WeatherEntity> result = [];
    result.add(value);
    return DayEntity(dayInfo: result);
  }
}

// cоздал для передачи в блок
// лист дней и индекс холодного дня
class DaysEntities {
  List<DayEntity> listDays;
  int couldDayindex;
  DaysEntities({
    required this.listDays,
    required this.couldDayindex,
  });
}
