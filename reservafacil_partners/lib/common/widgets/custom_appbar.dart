// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:reservafacil_partners/common/constants/app_colors.dart';

class CustomAppBar extends StatefulWidget {
  bool enableBackButton;
  Widget title;
  Widget? leading;
  List<Widget> actions;
  bool centerTitle;
  bool simple;
  CustomAppBar({
    super.key,
    this.enableBackButton = false,
    required this.title,
    this.leading,
    this.actions = const [],
    this.centerTitle = false,
    this.simple = false,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return !widget.simple
        ? Column(
            children: [
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: widget.centerTitle
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Botão Voltar
                  if (widget.enableBackButton)
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.primaryAlternative,
                      ),
                    ),

                  // Espaçamento entre o botão voltar e o título/elementos centrais
                  if (widget.enableBackButton) const SizedBox(width: 16),

                  // // Elemento Leading (se definido)
                  if (widget.leading != null) ...[
                    widget.leading!,
                    const SizedBox(width: 16),
                  ],

                  // Título Centralizado (caso aplicável)
                  if (widget.centerTitle && widget.actions.isEmpty)
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          widget.title,
                        ],
                      ),
                    )
                  else
                    widget.title,

                  // Espaçamento adicional para ações quando centralizado
                  // if (widget.centerTitle && widget.actions.isEmpty) const Spacer(),

                  // Ações
                  ...widget.actions,
                ],
              ),
            ],
          )
        : Column(
            children: [
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.primaryAlternative,
                    ),
                  ),
                  widget.title,
                  const SizedBox(
                    width: 14,
                    height: 14,
                    // child: const Placeholder(),
                  ),
                ],
              ),
            ],
          );
  }
}
