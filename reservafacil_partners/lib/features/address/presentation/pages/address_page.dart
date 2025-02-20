import 'package:flutter/material.dart';
import 'package:reservafacil_partners/common/widgets/app_responsive.dart';
import 'package:reservafacil_partners/features/address/presentation/widgets/address_mobile.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  @override
  Widget build(BuildContext context) {
    return AppResponsive(
      mobile: AddressMobile(),
    );
  }
}
