// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:reservafacil_partners/common/constants/app_sizing.dart';

// ignore: must_be_immutable
class AppResponsive extends StatefulWidget {
  Widget mobile;
  Widget? desktop;
  bool enableScrollView;

  AppResponsive({
    super.key,
    required this.mobile,
    this.desktop,
    this.enableScrollView = false,
  });

  @override
  State<AppResponsive> createState() => _AppResponsiveState();
}

class _AppResponsiveState extends State<AppResponsive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.enableScrollView
          ? SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: LayoutBuilder(
                builder: (_, constraints) {
                  if (constraints.maxWidth < AppSizing.breakpointLarge) {
                    return widget.mobile;
                  } else {
                    return widget.desktop ?? widget.mobile;
                  }
                },
              ),
            )
          : LayoutBuilder(
              builder: (_, constraints) {
                if (constraints.maxWidth < AppSizing.breakpointLarge) {
                  return widget.mobile;
                } else {
                  return widget.desktop ?? widget.mobile;
                }
              },
            ),
    );
  }
}
