// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:reservafacil_app/common/constants/app_sizing.dart';

class AppResponsive extends StatefulWidget {
  final Widget mobile;
  final Widget desktop;
  
  const AppResponsive({
    super.key,
    required this.mobile,
    required this.desktop,
  });

  @override
  State<AppResponsive> createState() => _AppResponsiveState();
}

class _AppResponsiveState extends State<AppResponsive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (_, constraints) {
            if (constraints.maxWidth < AppSizing.breakpointLarge) {
              return widget.mobile;
            } else {
              return widget.desktop;
            }
          },
        ),
      ),
    );
  }
}
