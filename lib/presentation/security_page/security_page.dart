import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/logic/language_and_password_bloc/language_and_password_bloc.dart';

import '../../../data/constants/app_colors.dart';
import '../../data/l10n/app_localizations.dart';
import '../main_page.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_fields.dart';

class SecurityPage extends StatefulWidget {
  const SecurityPage({super.key});

  @override
  State<SecurityPage> createState() => _SecurityPageState();
}

class _SecurityPageState extends State<SecurityPage> {
  late final TextEditingController controller;

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onPressed() {
    if (formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const PagesController(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);
    final password = context.watch<LanguageAndPasswordBloc>().state.password;
    String? passwordValidator(String? value) {
      if (value != password) {
        return localization.wrongPassword;
      }
      return null;
    }

    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Text(
                  localization.enterPassword,
                  style: const TextStyle(
                    fontSize: 25,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              CustomTextField(
                controller: controller,
                autofocus: true,
                height: 70,
                width: MediaQuery.sizeOf(context).width * .7,
                validator: passwordValidator,
                hintText: localization.enterPassword,
              ),
              CustomButton(
                text: localization.enter,
                onPressed: onPressed,
                width: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
