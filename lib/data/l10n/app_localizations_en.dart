import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get language => 'Language';

  @override
  String get english => 'English';

  @override
  String get russian => 'Russian';

  @override
  String get uzbek => 'Uzbek';

  @override
  String get profile => 'Profile';

  @override
  String get myProfile => 'My Profile';

  @override
  String get statistics => 'Statistics';

  @override
  String get settings => 'Settings';

  @override
  String get appName => 'TASK AND TIME MANAGER';

  @override
  String get about => 'About';

  @override
  String get version => 'Version';

  @override
  String get notification => 'Notification';

  @override
  String get security => 'Security';

  @override
  String get theme => 'Theme';

  @override
  String get name => 'Name';

  @override
  String get profession => 'Profession';

  @override
  String get dateOfBirth => 'Date of Birth';

  @override
  String get email => 'Email';

  @override
  String get save => 'Save';

  @override
  String get password => 'Password';

  @override
  String get currentPassword => 'Current Password';

  @override
  String get newPassword => 'New Password';

  @override
  String get confirmPassword => 'Confirm New Password';

  @override
  String get delete => 'Delete Password';

  @override
  String get setPassword => 'Set Password';

  @override
  String get addTask => 'Add Task';

  @override
  String get note => 'Note';

  @override
  String get date => 'Date';

  @override
  String get startTime => 'Start Time';

  @override
  String get endTime => 'End Time';

  @override
  String get remind => 'Remind';

  @override
  String get priority => 'Priority';

  @override
  String get createTask => 'Create Task';

  @override
  String get taskName => 'Enter Task Name';

  @override
  String get taskNote => 'Enter Task Note';

  @override
  String get dateModel => 'mm/dd/yyyy';

  @override
  String get timeModel => 'xx-yy';

  @override
  String get enterPriority => 'Choose Task Priority';

  @override
  String get minutes => 'Minutes';

  @override
  String get low => 'Low';

  @override
  String get medium => 'Medium';

  @override
  String get high => 'High';

  @override
  String get colors => 'Colors';

  @override
  String get home => 'Home';

  @override
  String get tasks => 'Tasks';

  @override
  String get calendar => 'Calendar';

  @override
  String get yourName => 'Your Name';

  @override
  String get yourProfession => 'Your Profession';

  @override
  String get yourEmail => 'Your Email';

  @override
  String get isPasswordTrue => 'Your password does not match previous password';

  @override
  String get isConfirmed => 'Your Confirmation code does not match new Password';

  @override
  String get noName => 'No Name';

  @override
  String get none => 'None';

  @override
  String get edit => 'Edit';

  @override
  String get deleteTask => 'Delete';

  @override
  String get hello => 'Hello!';

  @override
  String get noTasks => 'You do not have tasks now.\n Please add task';

  @override
  String get todayTasks => 'Today\'s Tasks';

  @override
  String get all => 'All';

  @override
  String get toDo => 'To-Do';

  @override
  String get completed => 'Completed';

  @override
  String get inProgress => 'In Progress';

  @override
  String get start => 'Start';

  @override
  String get finish => 'Finish';

  @override
  String get update => 'Update';

  @override
  String get noCompletedTask => 'You do not have completed task';

  @override
  String get noInProgressTask => 'You are not doing any task';

  @override
  String get totalTasks => 'Total Tasks';

  @override
  String get completedTasks => 'Completed Tasks';

  @override
  String get january => 'January';

  @override
  String get february => 'February';

  @override
  String get march => 'March';

  @override
  String get april => 'April';

  @override
  String get may => 'May';

  @override
  String get june => 'June';

  @override
  String get july => 'July';

  @override
  String get august => 'August';

  @override
  String get september => 'September';

  @override
  String get october => 'October';

  @override
  String get november => 'November';

  @override
  String get december => 'December';

  @override
  String get enterPassword => 'Enter Password';

  @override
  String get enter => 'Enter';

  @override
  String get wrongPassword => 'Wrong password. Please enter password again';

  @override
  String allTasks(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'You have $countString tasks',
      one: 'You have one task',
      zero: 'You do not have tasks',
    );
    return '$_temp0';
  }

  @override
  String tasksCompleted(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Tasks Completed',
      one: '1 Task Completed',
      zero: 'no Tasks Completed',
    );
    return '$_temp0';
  }
}
