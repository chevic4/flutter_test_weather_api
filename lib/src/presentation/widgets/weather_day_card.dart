import 'package:flutter/material.dart';

import 'package:flutter_weather_app_test/src/domain/entity/town_entity.dart';
import 'package:flutter_weather_app_test/src/presentation/widgets/weather_line_data.dart';
import 'package:flutter_weather_app_test/src/presentation/widgets/weather_line_title.dart';

class WeatherDayCard extends StatelessWidget {
  const WeatherDayCard({
    Key? key,
    required this.data,
  }) : super(key: key);
  final List<WeatherEntity> data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                _dateInfo(data.first.dateTime),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const SizedBox(height: 5),
            const WeatherLineTitleInfo(),
            const Divider(),
            SizedBox(
              height: 200,
              child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) =>
                    WeatherLineInfo(
                  data: data[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// так себе формат
// надо предобразить цифорки месяца в
// название но времени нет оставил так
String _dateInfo(DateTime data) {
  return ' ${data.day}.${data.month}.${data.year}';
}
