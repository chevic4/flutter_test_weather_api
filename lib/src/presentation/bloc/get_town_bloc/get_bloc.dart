import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_weather_app_test/src/domain/entity/day_entity.dart';
import 'package:flutter_weather_app_test/src/domain/services/get_location_service.dart';
import 'package:flutter_weather_app_test/src/domain/services/get_weather_bags_service.dart';
import 'package:flutter_weather_app_test/src/domain/services/get_weather_service.dart';
import 'package:flutter_weather_app_test/utils/network_checker.dart';

import 'get_event.dart';
import 'get_state.dart';

// блок будет в приложении один
// это быстрее и проще, хотя можно сделать блоки для каждых screenов

class GetTownBloc extends Bloc<GetTownEvent, GetTownState> {
  // состояние сети
  final NetworkInfo netInfo;
  // получение координат города
  final locationService = LocationService();
  // получение погоды в введеном городе
  final WeatherService weatherService;
  // обработать название вводимого города
  final TextEditingController controllerBloc = TextEditingController();
  // формирование суточной карточки о погоде
  final bagsService = BagsService();
  // положим данные о точках на 3 дня сюда и будем с ними работать
  List<DayEntity> listDays = [];

  GetTownBloc(
    this.weatherService,
    this.netInfo,
  ) : super(GetTownStateInit()) {
    // проверим интернет при инициализации
    _initBloc();

    // событие нажатия на (посмотреть погоду)
    on<GetTownEventPressOk>(
        (GetTownEventPressOk event, Emitter<GetTownState> emit) async {
      emit(GetTownStateLoading());

      // обработаем локацию города
      final townLocationResult =
          await locationService.getLocation(controllerBloc.text);

      // координаты вернулись => дальше
      if (townLocationResult.isLeft) {
        // получаем данные о погоде из координат
        final weatherResult =
            await weatherService.getWeatherInfo(townLocationResult.left);
        if (weatherResult.isLeft) {
          // боработаем список так чтобы холодный день
          // ушел в начало списка
          DaysEntities cacheListDays =
              bagsService.getDaysList(weatherResult.left);
          listDays = cacheListDays.listDays;
          if (cacheListDays.couldDayindex != 0) {
            listDays.insert(0, listDays.removeAt(cacheListDays.couldDayindex));
          }
          // отобразить необходимо элемент из полученного списка
          // потомучто в нём информация о погоде на тек дату
          Modular.to.pushNamed('/town',
              arguments: cacheListDays.listDays.first.dayInfo);
        } else {
          emit(GetTownStateMessage(message: 'данные о погоде не получены('));
        }
      } else {
        emit(GetTownStateMessage(message: 'введите город коррекно!'));
      }
    });

    // событие нажатия на (посмотреть 3 дня погоды)
    on<GetDetailEventPressOk>(
        (GetDetailEventPressOk event, Emitter<GetTownState> emit) async {
      Modular.to.pushNamed('/detail', arguments: listDays);
    });
    // go на первый экран
    on<GetHomePressOk>(
        (GetHomePressOk event, Emitter<GetTownState> emit) async {
      emit(GetTownStateInit());
      Modular.to.pushReplacementNamed('/');
    });
  }

  void _initBloc() async {
    final netStatus = await netInfo.isConnected;
    if (netStatus != true) {
      emit(GetTownStateMessage(message: 'упс! нет интернета!'));
    }
  }
}
