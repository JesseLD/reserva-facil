// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import 'package:reservafacil_app/common/constants/app_colors.dart';
import 'package:reservafacil_app/common/constants/app_text_styles.dart';
import 'package:reservafacil_app/features/address/data/models/address_model.dart';

class AddressWidget extends StatefulWidget {
  AddressModel address;
  bool selected;
  AddressWidget({
    Key? key,
    required this.address,
    this.selected = false,
  }) : super(key: key);

  @override
  State<AddressWidget> createState() => _AddressWidgetState();
}

class _AddressWidgetState extends State<AddressWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: widget.selected
              ? AppColors.primaryAlternative
              : Colors.transparent,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 16),
            Column(
              children: [
                Icon(
                  Ionicons.location_outline,
                ),
              ],
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    widget.address.address,
                    style: AppTextStyles.subtitleAlt.copyWith(
                      color: AppColors.gray,
                    ),
                    softWrap: true,
                  ),
                ),
                Text(
                  widget.address.neighborhood,
                  style: AppTextStyles.bodyAlt.copyWith(
                    color: AppColors.gray.withAlpha(150),
                  ),
                ),
                Text(
                  "${widget.address.city}, ${widget.address.state}",
                  style: AppTextStyles.bodyAlt.copyWith(
                    color: AppColors.gray.withAlpha(150),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    widget.address.reference,
                    style: AppTextStyles.bodyAlt.copyWith(
                      color: AppColors.gray.withAlpha(150),
                    ),
                    softWrap: true,
                  ),
                ),
              ],
            ),
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(width: 8),
                    if (widget.selected)
                      Icon(
                        Ionicons.checkmark_circle,
                        color: AppColors.primaryAlternative,
                        size: 20,
                      ),
                    SizedBox(width: 8),
                    Icon(
                      Ionicons.ellipsis_vertical,
                      color: AppColors.primaryAlternative,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
