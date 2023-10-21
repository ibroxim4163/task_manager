import 'package:flutter/material.dart';

import '../../../data/constants/app_colors.dart';
import '../../../data/constants/app_icons.dart';
import '../../data/l10n/app_localizations.dart';

class CustomBottomAppBar extends StatefulWidget {
  const CustomBottomAppBar({
    required this.onPressed,
    super.key,
  });

  final Function(int value) onPressed;

  @override
  State<CustomBottomAppBar> createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  final List<String> photos = [
    AppIcons.home,
    AppIcons.tasksIcon,
    "",
    AppIcons.calendar,
    AppIcons.profile,
  ];
  int currentIndex = 0;

  final List<double> sizes = [27, 30, 20, 25, 35];

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);

    final List<String> texts = [
      localization.home,
      localization.tasks,
      "",
      localization.calendar,
      localization.profile,
    ];
    return BottomAppBar(
      height: 60,
      color: AppColors.bottonColor,
      shape: const CircularNotchedRectangle(),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      notchMargin: 5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          5,
          (index) => index == 2
              ? Visibility(
                  visible: false,
                  child: Image.asset(
                    AppIcons.calendar,
                    color: AppColors.transparent,
                  ),
                )
              : Padding(
                  padding: EdgeInsets.only(left: index == 2 ? 100 : 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 5),
                      GestureDetector(
                        onTap: () {
                          widget.onPressed(index);
                          currentIndex = index;
                          setState(() {});
                        },
                        child: Image(
                          image: AssetImage(photos[index]),
                          color: currentIndex == index
                              ? const Color(0xFF5F33E1)
                              : Colors.grey,
                          height: sizes[index],
                        ),
                      ),
                      SizedBox(height: index == 4 ? 0 : 5),
                      Text(
                        texts[index],
                        style: TextStyle(
                          fontSize: 12,
                          color: currentIndex == index
                              ? const Color(0xFF5F33E1)
                              : Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 3),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
