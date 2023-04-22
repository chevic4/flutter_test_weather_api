import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_weather_app_test/src/data/repository/weather_repository_impl.dart';
import 'package:flutter_weather_app_test/src/domain/services/get_weather_service.dart';
import 'package:flutter_weather_app_test/src/presentation/bloc/get_town_bloc/get_bloc.dart';
import 'package:flutter_weather_app_test/src/presentation/screens/detail_info_screen.dart';
import 'package:flutter_weather_app_test/src/presentation/screens/get_town_screen.dart';
import 'package:flutter_weather_app_test/src/presentation/screens/town_info_screen.dart';
import 'package:flutter_weather_app_test/utils/network_checker.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        // состояние интернета
        Bind.singleton<NetworkInfo>((i) => NetworkInfoImpl()),
        // получение данных из сети о точках погоды на 3 дня
        Bind.singleton<WeatherService>(
            (i) => WeatherService(WeatherRepositoryImpl())),
        // создаем bloc
        Bind.singleton<GetTownBloc>((i) => GetTownBloc(
              i(), // weatherService
              i(), // networkInfo
            )),
        // Bind.factory<AlarmsListStorage>(
        //     (i) => AlarmsListStorageSharedPrefences()),
        // Bind.factory<AlarmsListRepository>(
        //     (i) => AlarmsListRepositoryImpl(i())),
        // Bind.factory<AlarmListService>((i) => AlarmListService(store: i())),
        // Bind.factory<TimeControllerService>((i) => TimeControllerService()),
      ];

  @override
  List<ModularRoute> get routes => [
        // 1 экран ввода города для просмотра погоды
        ChildRoute('/', child: (context, args) => const GetTownScreen()),

        // 2 экран информации о погоде в введенном городе
        ChildRoute('/town',
            transition: TransitionType.leftToRight,
            child: (context, args) => TownInfoScreen(
                  dataInfo: args.data,
                )),

        // 3 экран с информацией о погоде в введеном городе на 3 дня
        ChildRoute('/detail',
            transition: TransitionType.leftToRight,
            child: (context, args) => DetailInfoScreen(
                  listDays: args.data,
                )),
      ];
}
