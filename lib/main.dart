import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/data/constants/extensions.dart';

import 'data/l10n/app_localizations.dart';
import 'data/repositories/task_repository.dart';
import 'data/services/local_shared_preferences_storage.dart';
import 'data/services/local_sqflite_storage.dart';
import 'data/services/notification_service.dart';
import 'logic/language_and_password_bloc/language_and_password_bloc.dart';
import 'logic/simple_bloc_observer.dart';
import 'logic/task_bloc/task_bloc.dart';
import 'presentation/main_page.dart';
import 'presentation/security_page/security_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetBinding);
  await TaskLocalSqfliteStorage.init();
  await LocalSharedPreferencesStorage.dbInit();
  await NotificationService.settings();
  print("asdas");
  Bloc.observer = SimpleBlocObserver();
  runApp(const App());
  // await Future.delayed(Duration(seconds: 3));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TaskBloc>(
          create: (context) => TaskBloc(
            const TaskRepository(
              TaskLocalSqfliteStorage(),
            ),
          )..add(
              const LoadingEvent(
                firstLoading: true,
              ),
            ),
        ),
        BlocProvider<LanguageAndPasswordBloc>(
          create: (context) => LanguageAndPasswordBloc(
            LocalSharedPreferencesStorage(),
          )..add(
              LPLoadingEvent(),
            ),
        ),
      ],
      child: Builder(
        builder: (context) {
          Locale locale = context
              .watch<LanguageAndPasswordBloc>()
              .state
              .languageIndex
              .languageIndex();
          final password =
              context.watch<LanguageAndPasswordBloc>().state.password;
          print("password=$password");
          return MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: locale,
            home: password.isEmpty
                ? const PagesController()
                : const SecurityPage(),
          );
        },
      ),
    );
  }
}
