import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:reservafacil_app/common/constants/app_colors.dart';
import 'package:reservafacil_app/common/constants/app_input_styles.dart';
import 'package:reservafacil_app/common/constants/app_text_styles.dart';
import 'package:reservafacil_app/common/widgets/dynamic_spacer.dart';
import 'package:reservafacil_app/features/address/logic/providers/address_provider.dart';
import 'package:reservafacil_app/features/address/presentation/widgets/address_widget.dart';

class AddressMobile extends StatefulWidget {
  const AddressMobile({super.key});

  @override
  State<AddressMobile> createState() => _AddressMobileState();
}

class _AddressMobileState extends State<AddressMobile> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final addressProvider = Provider.of<AddressProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          DynamicSpacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Ionicons.chevron_back_outline,
                  color: AppColors.primaryAlternative,
                ),
              ),
              Text(
                "Endereços",
                style: AppTextStyles.button,
              ),
              SizedBox(width: 16),
            ],
          ),
          SizedBox(height: 16),
          Form(
            key: _formKey,
            child: TextFormField(
              decoration: AppInputStyles.primaryInput.copyWith(
                prefixIcon: const Icon(Icons.search),
                hintText: "Buscar endereço",
              ),
            ),
          ),
          SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 16),
                  Icon(
                    Ionicons.locate_outline,
                    color: AppColors.gray.withAlpha(150),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Adicionar novo endereço",
                        style: AppTextStyles.subtitleAlt.copyWith(
                          color: AppColors.gray,
                        ),
                      ),
                      Text(
                        "Clique para adicionar um novo endereço",
                        style: TextStyle(
                          color: AppColors.gray.withAlpha(150),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: addressProvider.addresses.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    addressProvider.selectedAddress = index;
                  });
                },
                child: Column(
                  children: [
                    AddressWidget(
                      address: addressProvider.addresses[index],
                      selected: addressProvider.selectedAddress == index,
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
