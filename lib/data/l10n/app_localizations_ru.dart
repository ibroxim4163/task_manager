import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get language => 'Язык';

  @override
  String get english => 'Английский';

  @override
  String get russian => 'Русский';

  @override
  String get uzbek => 'Узбекский';

  @override
  String get profile => 'Профиль';

  @override
  String get myProfile => 'Мой профайл';

  @override
  String get statistics => 'Статистика';

  @override
  String get settings => 'Настройки';

  @override
  String get appName => 'МЕНЕДЖЕР ЗАДАЧ И ВРЕМЕНИ';

  @override
  String get about => 'О приложении';

  @override
  String get version => 'Версия';

  @override
  String get notification => 'Уведомление';

  @override
  String get security => 'Безопасность';

  @override
  String get theme => 'Тема';

  @override
  String get name => 'Имя';

  @override
  String get profession => 'Профессия';

  @override
  String get dateOfBirth => 'Дата рождения';

  @override
  String get email => 'Электронная почта';

  @override
  String get save => 'Сохранять';

  @override
  String get password => 'Пароль';

  @override
  String get currentPassword => 'Текущий пароль';

  @override
  String get newPassword => 'Новый пароль';

  @override
  String get confirmPassword => 'Подтвердите новый пароль';

  @override
  String get delete => 'Удалить пароль';

  @override
  String get setPassword => 'Установка пароля';

  @override
  String get addTask => 'Добавить задачу';

  @override
  String get note => 'Заметка';

  @override
  String get date => 'Дата';

  @override
  String get startTime => 'Время начала';

  @override
  String get endTime => 'Время окончания';

  @override
  String get remind => 'Напоминать';

  @override
  String get priority => 'Приоритет';

  @override
  String get createTask => 'Создать задачу';

  @override
  String get taskName => 'Введите имя задачи';

  @override
  String get taskNote => 'Введите заметку о задаче';

  @override
  String get dateModel => 'мм/дд/гггг';

  @override
  String get timeModel => 'xx-yy';

  @override
  String get enterPriority => 'Выберите приоритет задачи';

  @override
  String get minutes => 'Минут';

  @override
  String get low => 'Низкий';

  @override
  String get medium => 'Средний';

  @override
  String get high => 'Высокий';

  @override
  String get colors => 'Цветов';

  @override
  String get home => 'Дом';

  @override
  String get tasks => 'Задачи';

  @override
  String get calendar => 'Календарь';

  @override
  String get yourName => 'Ваше имя';

  @override
  String get yourProfession => 'Ваши Профессии';

  @override
  String get yourEmail => 'электронной почты';

  @override
  String get isPasswordTrue => 'Ваш пароль не соответствует предыдущему паролю';

  @override
  String get isConfirmed => 'Ваш код подтверждения не соответствует новому паролю';

  @override
  String get noName => 'Без имени';

  @override
  String get none => 'Никто';

  @override
  String get edit => 'Изменить';

  @override
  String get deleteTask => 'Удалить';

  @override
  String get hello => 'Привет!';

  @override
  String get noTasks => 'Сейчас у вас нет задач.\n Добавьте задачу.';

  @override
  String get todayTasks => 'Сегодняшние задачи';

  @override
  String get all => 'Все';

  @override
  String get toDo => 'Делать';

  @override
  String get completed => 'Завершенный';

  @override
  String get inProgress => 'В процессе';

  @override
  String get start => 'Начинать';

  @override
  String get finish => 'Заканчивать';

  @override
  String get update => 'Обновлять';

  @override
  String get noCompletedTask => 'Вы не выполнили задание';

  @override
  String get noInProgressTask => 'Вы не выполняете никаких задач';

  @override
  String get totalTasks => 'Всего задач';

  @override
  String get completedTasks => 'Выполненные задачи';

  @override
  String get january => 'Январь';

  @override
  String get february => 'Февраль';

  @override
  String get march => 'Март';

  @override
  String get april => 'Апрель';

  @override
  String get may => 'Май';

  @override
  String get june => 'Июнь';

  @override
  String get july => 'Июль';

  @override
  String get august => 'Август';

  @override
  String get september => 'Сентябрь';

  @override
  String get october => 'Октябрь';

  @override
  String get november => 'Ноябрь';

  @override
  String get december => 'Декабрь';

  @override
  String get enterPassword => 'Введите пароль';

  @override
  String get enter => 'Входить';

  @override
  String get wrongPassword => 'Неправильный пароль. Пожалуйста, введите пароль еще раз';

  @override
  String allTasks(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'У вас есть $countString задач',
      one: 'У тебя есть одна задача',
      zero: 'У вас нет задач',
    );
    return '$_temp0';
  }

  @override
  String tasksCompleted(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Задач Выполнено',
      one: '1 задача выполнена',
      zero: 'Нет выполненных задач',
    );
    return '$_temp0';
  }
}
