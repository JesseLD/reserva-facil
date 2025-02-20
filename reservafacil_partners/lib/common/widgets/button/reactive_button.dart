// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reservafacil_partners/common/constants/app_button_styles.dart';
import 'package:reservafacil_partners/common/providers/global_state_provider.dart';
import 'package:reservafacil_partners/common/widgets/custom_circular_progress_indicator.dart';

class ReactiveButton extends StatefulWidget {
  Widget child;
  Function? onPressed;
  bool alternateColor;
  ReactiveButton({
    super.key,
    required this.child,
    this.onPressed,
    this.alternateColor = false,
  });

  @override
  State<ReactiveButton> createState() => _ReactiveButtonState();
}

class _ReactiveButtonState extends State<ReactiveButton> {
  @override
  Widget build(BuildContext context) {
    final globalStateProvider =
        Provider.of<GlobalStateProvider>(context, listen: true);
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: widget.alternateColor
                ? AppButtonStyles.secondaryButtonStyle
                : AppButtonStyles.primaryButtonStyle,
            onPressed: () {
              if (globalStateProvider.isLoading) return;
              if (widget.onPressed != null) {
                widget.onPressed!();
              }
            },
            child: globalStateProvider.isLoading
                ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CustomCircularProgressIndicator(),
                  )
                : widget.child,
          ),
        ),
      ],
    );
  }
}
