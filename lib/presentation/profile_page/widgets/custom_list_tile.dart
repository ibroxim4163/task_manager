import 'package:flutter/material.dart';

import '../../../../data/constants/app_colors.dart';

class CustomListTile extends StatelessWidget {
  final String? iconUrl;
  final String title;
  final IconData? icon;
  final void Function()? onTap;
  final double size;
  final Widget? trailing;
  final bool? selected;
  const CustomListTile({
    required this.title,
    this.iconUrl,
    this.icon,
    this.trailing,
    this.selected,
    this.onTap,
    this.size = 30,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        child: ListTile(
          selected: true,
          leading: icon != null
              ? Icon(icon, color: AppColors.mainColor, size: 30)
              : trailing != null
                  ? null
                  : Image(
                      width: size + 5,
                      height: size,
                      image: AssetImage(iconUrl ?? ""),
                    ),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              color: AppColors.mainColor,
            ),
          ),
          onTap: onTap,
          trailing: trailing,
        ),
      ),
    );
  }
}
