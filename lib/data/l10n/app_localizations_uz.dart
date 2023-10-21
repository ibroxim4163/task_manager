import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for Uzbek (`uz`).
class AppLocalizationsUz extends AppLocalizations {
  AppLocalizationsUz([String locale = 'uz']) : super(locale);

  @override
  String get language => 'Til';

  @override
  String get english => 'Ingliz';

  @override
  String get russian => 'Rus';

  @override
  String get uzbek => 'O\'zbek';

  @override
  String get profile => 'Profil';

  @override
  String get myProfile => 'Mening Profilim';

  @override
  String get statistics => 'Statistika';

  @override
  String get settings => 'Sozlamalar';

  @override
  String get appName => 'Vazifalar va vaqt boshqaruvchisi';

  @override
  String get about => 'Dastur haqida';

  @override
  String get version => 'Versiya';

  @override
  String get notification => 'Bildirishnoma';

  @override
  String get security => 'Xavfsizlik';

  @override
  String get theme => 'Mavzu';

  @override
  String get name => 'Ism';

  @override
  String get profession => 'Kasb';

  @override
  String get dateOfBirth => 'Tug\'ilgan Sana';

  @override
  String get email => 'Elektron pochta';

  @override
  String get save => 'Saqlash';

  @override
  String get password => 'Parol';

  @override
  String get currentPassword => 'Joriy Parol';

  @override
  String get newPassword => 'Yangi Parol';

  @override
  String get confirmPassword => 'Yangi parolni tasdiqlang';

  @override
  String get delete => 'Parolni o\'chirish';

  @override
  String get setPassword => 'Parol O\'rnating';

  @override
  String get addTask => 'Vazifa qo\'shish';

  @override
  String get note => 'Qayd';

  @override
  String get date => 'Sana';

  @override
  String get startTime => 'Boshlanish Vaqti';

  @override
  String get endTime => 'Tugash Vaqti';

  @override
  String get remind => 'Eslatma';

  @override
  String get priority => 'Muhimligi';

  @override
  String get createTask => 'Vazifa yaratish';

  @override
  String get taskName => 'Vazifa nomini kiriting';

  @override
  String get taskNote => 'Vazifa Uchun Qayd Kiriting';

  @override
  String get dateModel => 'oo/kk/yyyy';

  @override
  String get timeModel => 'xx-yy';

  @override
  String get enterPriority => 'Vazifa Ustivorligini Tanlang';

  @override
  String get minutes => 'Daqiqa';

  @override
  String get low => 'Past';

  @override
  String get medium => 'O\'rta';

  @override
  String get high => 'Yuqori';

  @override
  String get colors => 'Ranglar';

  @override
  String get home => 'Uy';

  @override
  String get tasks => 'Vazifalar';

  @override
  String get calendar => 'Kalendar';

  @override
  String get yourName => 'Sizning Ismingiz';

  @override
  String get yourProfession => 'Sizning kasbingiz';

  @override
  String get yourEmail => 'Sizning emailingiz';

  @override
  String get isPasswordTrue => 'Sizning parolingiz avvalgi parolga mos kelmaydi';

  @override
  String get isConfirmed => 'Tasdiqlash kodingiz yangi parolga mos kelmaydi';

  @override
  String get noName => 'Ism Yo\'q';

  @override
  String get none => 'Hech Qaysi';

  @override
  String get edit => 'Tahrirlash';

  @override
  String get deleteTask => 'O\'chirish';

  @override
  String get hello => 'Salom!';

  @override
  String get noTasks => 'Sizda hozir vazifa yo‘q.\n Iltimos, vazifa qo‘shing';

  @override
  String get todayTasks => 'Bugungi vazifalar';

  @override
  String get all => 'Hammasi';

  @override
  String get toDo => 'Qilish';

  @override
  String get completed => 'Bajarilgan';

  @override
  String get inProgress => 'Bajarilayotgan';

  @override
  String get start => 'Boshlang';

  @override
  String get finish => 'Tugating';

  @override
  String get update => 'Yangilash';

  @override
  String get noCompletedTask => 'Sizda bajarilgan vazifa yo\'q';

  @override
  String get noInProgressTask => 'Siz hech qanday vazifani bajarmaysiz';

  @override
  String get totalTasks => 'Jami vazifalar';

  @override
  String get completedTasks => 'Bajarilgan vazifalar';

  @override
  String get january => 'Yanvar';

  @override
  String get february => 'Fevral';

  @override
  String get march => 'Mart';

  @override
  String get april => 'Aprel';

  @override
  String get may => 'May';

  @override
  String get june => 'Iyun';

  @override
  String get july => 'Iyul';

  @override
  String get august => 'Avgust';

  @override
  String get september => 'Sentaybr';

  @override
  String get october => 'Oktaybr';

  @override
  String get november => 'Noyabr';

  @override
  String get december => 'Dekabr';

  @override
  String get enterPassword => 'Parolni kiriting';

  @override
  String get enter => 'Kiring';

  @override
  String get wrongPassword => 'Noto\'g\'ri parol. Iltimos, parolni qayta kiriting';

  @override
  String allTasks(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString ta Vazifa bor',
      zero: 'Vazifalar Yo\'q',
    );
    return '$_temp0';
  }

  @override
  String tasksCompleted(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ta vazifa bajarildi',
      zero: 'Vazifalar Yo\'q',
    );
    return '$_temp0';
  }
}
