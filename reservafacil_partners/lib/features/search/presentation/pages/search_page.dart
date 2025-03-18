import 'package:flutter/material.dart';
import 'package:reservafacil_partners/common/widgets/app_responsive.dart';
import 'package:reservafacil_partners/features/search/presentation/widgets/search_mobile.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return AppResponsive(mobile: SearchMobile());
  }
}
