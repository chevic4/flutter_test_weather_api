import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_weather_app_test/src/domain/entity/town_entity.dart';
import 'package:flutter_weather_app_test/src/presentation/bloc/get_town_bloc/get_bloc.dart';
import 'package:flutter_weather_app_test/src/presentation/bloc/get_town_bloc/get_event.dart';
import 'package:flutter_weather_app_test/src/presentation/widgets/town_name_widget.dart';
import 'package:flutter_weather_app_test/src/presentation/widgets/weather_day_card.dart';

// 2 экран информации о погоде в введенном городе
class TownInfoScreen extends StatelessWidget {
  final List<WeatherEntity> dataInfo;
  const TownInfoScreen({super.key, required this.dataInfo});
  @override
  Widget build(BuildContext context) {
    final bloc = Modular.get<GetTownBloc>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: FilledButton.icon(
                onPressed: () => bloc.add(
                      GetDetailEventPressOk(),
                    ),
                icon: const Icon(Icons.sunny),
                label: const Text('посмотреть на 3 дня')),
          ),
        ],
      ),
      body: Column(
        children: [
          TownNameWidget(nameTown: bloc.controllerBloc.text),
          WeatherDayCard(data: dataInfo),
          FilledButton.icon(
              onPressed: () => bloc.add(GetHomePressOk()),
              icon: const Icon(Icons.home),
              label: const Text('в новый город')),
        ],
      ),
    );
  }
}
