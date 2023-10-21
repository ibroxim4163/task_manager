import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../data/constants/app_colors.dart';
import '../../data/constants/app_icons.dart';

class NoTasks extends StatelessWidget {
  final String text;
  const NoTasks({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            AppIcons.noTasks,
            height: MediaQuery.sizeOf(context).height * .3,
          ),
          const SizedBox(height: 20),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 25,
              color: AppColors.blackColor,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}
