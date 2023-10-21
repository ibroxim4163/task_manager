import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/services/local_shared_preferences_storage.dart';

part 'language_and_password_event.dart';
part 'language_and_password_state.dart';

class LanguageAndPasswordBloc
    extends Bloc<LanguageAndPasswordEvent, LanguageAndPasswordState> {
  final LocalSharedPreferencesStorage dbService;
  LanguageAndPasswordBloc(this.dbService)
      : super(
          const LoadingState(
            languageIndex: 0,
            password: "",
          ),
        ) {
    on<LanguageAndPasswordEvent>((event, emit) {
      return switch (event) {
        LPLoadingEvent e => _loading(e, emit),
        ChangeLanguage e => _changeLanguage(e, emit),
        ChangePassword e => _changePassword(e, emit),
        ErrorEvent() => null,
        DeletePassword e => _deletePassword(e, emit),
      };
    });
  }

  void _changeLanguage(
    ChangeLanguage e,
    Emitter<LanguageAndPasswordState> emit,
  ) async {
    try {
      dbService.setLanguageIndex(e.index);
    } catch (e) {
      emit(
        ErrorState(
          languageIndex: state.languageIndex,
          password: state.password,
          message: "Something went wrong",
        ),
      );
    }
  }

  void _changePassword(
      ChangePassword e, Emitter<LanguageAndPasswordState> emit) async {
    try {
      await dbService.setPassword(e.password);
    } catch (e) {
      emit(
        ErrorState(
          languageIndex: state.languageIndex,
          password: state.password,
          message: "Something went wrong",
        ),
      );
    }
  }

  Future<void> _loading(
    LPLoadingEvent e,
    Emitter<LanguageAndPasswordState> emit,
  ) async {
    try {
      int index = dbService.getLanguageIndex();
      String password = dbService.getPassword() ?? "";
      emit(
        LoadingState(
          languageIndex: index,
          password: password,
        ),
      );
    } catch (e) {
      emit(
        ErrorState(
          message: "Something went wrong",
          languageIndex: state.languageIndex,
          password: state.password,
        ),
      );
    }
  }

  void _deletePassword(
    DeletePassword e,
    Emitter<LanguageAndPasswordState> emit,
  ) {
    try {
      dbService.deletePassword();
    } catch (e) {
      emit(
        ErrorState(
          message: "Something went wrong",
          languageIndex: state.languageIndex,
          password: state.password,
        ),
      );
    }
  }
}
