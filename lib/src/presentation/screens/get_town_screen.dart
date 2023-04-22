import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_weather_app_test/src/presentation/bloc/get_town_bloc/get_bloc.dart';
import 'package:flutter_weather_app_test/src/presentation/bloc/get_town_bloc/get_event.dart';
import 'package:flutter_weather_app_test/src/presentation/bloc/get_town_bloc/get_state.dart';

// 1 экран ввода города для просмотра погоды
class GetTownScreen extends StatelessWidget {
  const GetTownScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final blocGetScreen = Modular.get<GetTownBloc>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('введи город'),
      ),
      body: BlocConsumer<GetTownBloc, GetTownState>(
        // слушаем стейт постоянно и в случае появления
        // в стейте ошибки покажем её
        listener: (context, state) {
          if (state is GetTownStateMessage) {
            final snackBar = SnackBar(
              content: Text(state.message),
              action: SnackBarAction(
                label: 'ok(',
                onPressed: () {},
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        bloc: blocGetScreen,
        builder: (context, state) {
          return SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: blocGetScreen.controllerBloc,
                    textInputAction: TextInputAction.done,
                    textDirection: TextDirection.ltr,
                    obscureText: false,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      labelText: 'введите название города',
                      hintText: 'Город',
                    ),
                  ),
                ),
                // в зависимости от стейта будем отображать разные виджеты
                // для этого нужен билдер
                BlocBuilder<GetTownBloc, GetTownState>(
                  bloc: blocGetScreen,
                  builder: (context, state) {
                    if (state is GetTownStateLoading) {
                      return const CircularProgressIndicator();
                    } else {
                      return FilledButton(
                        child: const Text('посмотреть погоду'),
                        onPressed: () {
                          blocGetScreen.add(GetTownEventPressOk());
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
