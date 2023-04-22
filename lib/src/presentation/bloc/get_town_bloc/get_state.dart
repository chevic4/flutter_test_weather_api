abstract class GetTownState {}

// стейт инициализации
class GetTownStateInit extends GetTownState {}

// стейт процесса загрузки
class GetTownStateLoading extends GetTownState {}

// стейт данные загружены норм!
class GetTownStateIsLoaded extends GetTownState {}

// стейт с информацией об ошибке
class GetTownStateMessage extends GetTownState {
  String message;
  GetTownStateMessage({
    required this.message,
  });
}
