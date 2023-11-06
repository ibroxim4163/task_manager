import 'package:flutter/material.dart';

import '../../../../data/constants/app_colors.dart';
import '../../../data/l10n/app_localizations.dart';

class HomeSections extends StatefulWidget {
  final ValueNotifier<int> selectedSection;
  const HomeSections({
    required this.selectedSection,
    super.key,
  });

  @override
  State<HomeSections> createState() => _HomeSectionsState();
}

class _HomeSectionsState extends State<HomeSections> {
  late final AppLocalizations localization;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    localization = AppLocalizations.of(context);
  }

  late final sectionNames = [
    localization.all,
    localization.toDo,
    localization.completed,
    localization.inProgress,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Center(
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(17),
                    ),
                    side: BorderSide(
                      width: 1,
                      color: AppColors.mainColor,
                    )),
                backgroundColor: widget.selectedSection.value == index
                    ? AppColors.mainColor
                    : AppColors.whiteColor,
              ),
              onPressed: () async {
                setState(() {
                  widget.selectedSection.value = index;
                });
                
              },
              child: Text(
                sectionNames[index],
                style: TextStyle(
                  fontSize: 10,
                  color: widget.selectedSection.value == index
                      ? AppColors.whiteColor
                      : AppColors.mainColor,
                ),
              ),
            ),
          ),
          itemCount: 4,
        ),
      ),
    );
  }
}
