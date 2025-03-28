// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DrawerGroup extends StatefulWidget {
  Widget title;
  List<Widget> children;
  DrawerGroup({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  State<DrawerGroup> createState() => _DrawerGroupState();
}

class _DrawerGroupState extends State<DrawerGroup> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              widget.title,
            ],
          ),
          Column(
            children: widget.children,
          ),
        ],
      ),
    );
  }
}
