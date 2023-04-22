abstract class GetTownEvent {}

//на 1м экране(поиск города) нажали кнопку поиска погоды в введеном городе
class GetTownEventPressOk extends GetTownEvent {}

//на 2м экране(погода на день) нажали посмотреть инфо на 3 дня
class GetDetailEventPressOk extends GetTownEvent {}

//на 2м экране нажать вернуться к поиску города
class GetHomePressOk extends GetTownEvent {}
