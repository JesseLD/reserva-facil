// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:reservafacil_partners/common/constants/app_colors.dart';

enum InfoType { warning, success, harmful }

class InfoWidget extends StatefulWidget {
  Widget title;
  final InfoType type;

  InfoWidget({
    super.key,
    required this.title,
    required this.type,
  });

  @override
  State<InfoWidget> createState() => _InfoWidgetState();
}

class _InfoWidgetState extends State<InfoWidget> {
  Color get _color {
    switch (widget.type) {
      case InfoType.warning:
        return AppColors.warningOrange;
      case InfoType.success:
        return AppColors.successGreen;
      case InfoType.harmful:
        return AppColors.dangerRed;
      default:
        return AppColors.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width * 0.03,
      decoration: BoxDecoration(
        color: _color,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: widget.title,
          ),
        ],
      ),
    );
  }
}
