// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:reservafacil_app/common/constants/app_colors.dart';
import 'package:reservafacil_app/common/constants/app_text_styles.dart';

class DrawerItem extends StatelessWidget {
  IconData? icon;
  String title;
  TextStyle? titleStyle;
  Function() onTap;
  int? notification;
  Icon? trailingIcon;
  Widget? description;

  DrawerItem({
    super.key,
    this.icon,
    required this.title,
    required this.onTap,
    this.notification,
    this.titleStyle,
    this.trailingIcon,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: ListTile(
        iconColor: AppColors.gray,
        shape: Border(
          bottom: BorderSide(
            color: AppColors.gray.withAlpha(60),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if (icon != null)
                  Icon(
                    icon,
                    color: AppColors.gray,
                    size: 28,
                  ),
                if (icon != null)
                  const SizedBox(
                    width: 16,
                  ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: titleStyle ??
                          AppTextStyles.button.copyWith(
                            color: AppColors.gray,
                          ),
                    ),
                    // SizedBox(
                    //   height: 4,
                    // ),
                    if (description != null) description!,
                  ],
                ),
                if (notification != null)
                  const SizedBox(
                    width: 4,
                  ),
                if (notification != null)
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: AppColors.dangerRed,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      notification.toString(),
                      style: AppTextStyles.body.copyWith(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
              ],
            ),
            trailingIcon ??
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: AppColors.gray.withAlpha(100),
                ),
          ],
        ),
      ),
    );
  }
}
