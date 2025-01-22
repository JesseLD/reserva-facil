// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:reservafacil_app/common/constants/app_colors.dart';
import 'package:reservafacil_app/common/constants/app_text_styles.dart';

class DrawerItem extends StatelessWidget {
  IconData icon;
  String title;
  Function() onTap;
  int? notification;

  DrawerItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.notification,
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
                Icon(
                  icon,
                  color: AppColors.gray,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  title,
                  style: AppTextStyles.button.copyWith(
                    color: AppColors.gray,
                  ),
                ),
                if (notification != null)
                  const SizedBox(
                    width: 4,
                  ),
                if (notification != null)
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
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
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.gray.withAlpha(100),
            ),
          ],
        ),
      ),
    );
  }
}
