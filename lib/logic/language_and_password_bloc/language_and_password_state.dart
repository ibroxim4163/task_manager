part of 'language_and_password_bloc.dart';

sealed class LanguageAndPasswordState extends Equatable {
  final int languageIndex;
  final String password;
  const LanguageAndPasswordState({
    required this.languageIndex,
    required this.password,
  });

  @override
  List<Object> get props => [languageIndex, password];
}

final class LoadingState extends LanguageAndPasswordState {
  const LoadingState({
    required super.languageIndex,
    required super.password,
  });
}

final class ErrorState extends LanguageAndPasswordState {
  final String message;

  const ErrorState({
    required this.message,
    required super.languageIndex,
    required super.password,
  });
}
