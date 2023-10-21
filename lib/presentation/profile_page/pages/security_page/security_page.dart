import 'package:flutter/material.dart';

import '../../../../../data/constants/app_colors.dart';
import '../../../../data/l10n/app_localizations.dart';
import '../../../widgets/custom_text_fields.dart';
import 'security_page_mixin.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text.dart';
import '../../widgets/custom_app_bar.dart';

class ProfileSecurityPage extends StatefulWidget {
  const ProfileSecurityPage({super.key});

  @override
  State<ProfileSecurityPage> createState() => _ProfileSecurityPageState();
}

class _ProfileSecurityPageState extends State<ProfileSecurityPage>
    with ProfileSecurityPageMixin {
  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.mainColor,
      body: SafeArea(
        child: Column(
          children: [
            CustomSettingsAppBar(text: localization.security),
            Expanded(
              flex: 8,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 25, left: 40, bottom: 15),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: CustomText(
                            text: localization.password,
                            fontSize: 20,
                            textColor: AppColors.mainColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: password == null ? 20 : 0),
                      password == null
                          ? CustomTextField(
                              controller: newPasswordController,
                              hintText: localization.setPassword,
                            )
                          : Column(
                              children: [
                                CustomTextField(
                                  hintText: localization.currentPassword,
                                  controller: currentPasswordController,
                                  validator: isPasswordTrue,
                                ),
                                const SizedBox(height: 10),
                                CustomTextField(
                                  hintText: localization.newPassword,
                                  controller: newPasswordController,
                                ),
                                const SizedBox(height: 10),
                                CustomTextField(
                                  hintText: localization.confirmPassword,
                                  controller: confirmPasswordController,
                                  validator: isConfirmationTrue,
                                ),
                              ],
                            ),
                      SizedBox(height: password == null ? 60 : 15),
                      CustomButton(
                        text: localization.save,
                        onPressed: setPassword,
                      ),
                      const SizedBox(height: 20),
                      Visibility(
                        visible: password != null,
                        child: CustomButton(
                          text: localization.delete,
                          onPressed: deletePassword,
                          color: AppColors.redColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
