import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_weather_app_test/src/domain/entity/day_entity.dart';
import 'package:flutter_weather_app_test/src/presentation/widgets/weather_day_card.dart';

// 3 экран с информацией о погоде в введеном городе на 3 дня
class DetailInfoScreen extends StatefulWidget {
  final List<DayEntity> listDays;
  const DetailInfoScreen({
    Key? key,
    required this.listDays,
  }) : super(key: key);

  @override
  State<DetailInfoScreen> createState() => _DetailInfoScreenState();
}

class _DetailInfoScreenState extends State<DetailInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: FilledButton.icon(
              onPressed: () {
                Modular.to.pop();
              },
              icon: const Icon(Icons.sunny),
              label: const Text('назад в город'),
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => SizedBox(
                height: 380,
                child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child:
                        WeatherDayCard(data: widget.listDays[index].dayInfo)),
              ),
              childCount: widget.listDays.length,
            ),
          ),
        ],
      ),
    );
  }
}
