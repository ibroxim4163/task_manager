import 'package:flutter/material.dart';

import '../../../../data/constants/app_colors.dart';
import '../../../data/l10n/app_localizations.dart';
import '../widgets/custom_app_bar.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final localization = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: SafeArea(
        child: Column(
          children: [
            CustomSettingsAppBar(text: localization.about),
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
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: screenSize.height * .17),
                      Center(
                        child: Text(
                          localization.appName,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 23,
                            color: AppColors.mainColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      CustomPaint(
                        size: const Size(100, 50),
                        painter: MyCustomPainter(),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "${localization.version} 1.0.0",
                        style: const TextStyle(
                          color: AppColors.versionColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: screenSize.height * .1),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = AppColors.mainColor;
    final path = Path()
      ..quadraticBezierTo(size.width / 2, size.height, size.width, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(MyCustomPainter oldDelegate) => false;
}
