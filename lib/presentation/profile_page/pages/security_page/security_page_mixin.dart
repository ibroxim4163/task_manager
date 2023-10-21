import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/data/services/local_shared_preferences_storage.dart';

import '../../../../data/l10n/app_localizations.dart';
import '../../../../logic/language_and_password_bloc/language_and_password_bloc.dart';
import 'security_page.dart';

mixin ProfileSecurityPageMixin on State<ProfileSecurityPage> {
  late TextEditingController currentPasswordController;
  late TextEditingController newPasswordController;
  late TextEditingController confirmPasswordController;
  late String? password;

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    currentPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    password = LocalSharedPreferencesStorage().getPassword();

    super.didChangeDependencies();
  }

  void deletePassword() async {
    if (formKey.currentState!.validate()) {
      context.read<LanguageAndPasswordBloc>().add(DeletePassword());
      context.read<LanguageAndPasswordBloc>().add(LPLoadingEvent());
      Future.delayed(
        const Duration(microseconds: 500),
        () => Navigator.pop(context),
      );
    }
  }

  void setPassword() {
    if (formKey.currentState!.validate()) {
      context.read<LanguageAndPasswordBloc>().add(
            ChangePassword(
              newPasswordController.text,
            ),
          );
      context.read<LanguageAndPasswordBloc>().add(LPLoadingEvent());
      Future.delayed(
        const Duration(microseconds: 500),
        () => Navigator.pop(context),
      );
    }
  }

  

  String? isPasswordTrue(String? value) {
    final localization = AppLocalizations.of(context);
    if (password != currentPasswordController.text) {
      return localization.isPasswordTrue;
    }

    return null;
  }

  String? isConfirmationTrue(String? value) {
    final localization = AppLocalizations.of(context);
    if (newPasswordController.text != confirmPasswordController.text) {
      return localization.isConfirmed;
    }
    return null;
  }
}
