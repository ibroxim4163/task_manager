part of 'language_and_password_bloc.dart';

sealed class LanguageAndPasswordEvent extends Equatable {
  const LanguageAndPasswordEvent();
}

class ChangeLanguage extends LanguageAndPasswordEvent {
  final int index;
  const ChangeLanguage(this.index);

  @override
  List<Object?> get props => [index];
}

class ChangePassword extends LanguageAndPasswordEvent {
  final String password;
  const ChangePassword(this.password);

  @override
  List<Object?> get props => [password];
}

class LPLoadingEvent extends LanguageAndPasswordEvent {
  @override
  List<Object?> get props => [];
}

class DeletePassword extends LanguageAndPasswordEvent {
  @override
  List<Object?> get props => [];
}

class ErrorEvent extends LanguageAndPasswordEvent {
  final String message;
  const ErrorEvent(this.message);

  @override
  List<Object?> get props => [message];
}
