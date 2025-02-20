import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:reservafacil_partners/common/constants/app_colors.dart';
import 'package:reservafacil_partners/common/constants/app_input_styles.dart';
import 'package:reservafacil_partners/common/constants/app_text_styles.dart';
import 'package:reservafacil_partners/common/widgets/dynamic_spacer.dart';
import 'package:reservafacil_partners/features/restaurant/logic/providers/restaurant_provider.dart';

class SearchMobile extends StatefulWidget {
  const SearchMobile({super.key});

  @override
  State<SearchMobile> createState() => _SearchMobileState();
}

class _SearchMobileState extends State<SearchMobile> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final restaurantProvider = Provider.of<RestaurantProvider>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DynamicSpacer(),
            Form(
              key: _formKey,
              child: TextFormField(
                decoration: AppInputStyles.primaryInput.copyWith(
                  hintText: 'O que vai pedir hoje?',
                  prefixIcon: Icon(
                    Ionicons.search,
                    color: AppColors.primary,
                  ),
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Digite algo para pesquisar';
                  }
                  if (value.isEmpty) {
                    return 'Digite algo para pesquisar';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Text(
                  'Categorias',
                  style: AppTextStyles.subtitle,
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Define 2 colunas
                crossAxisSpacing: 10, // Espaçamento horizontal
                mainAxisSpacing: 10, // Espaçamento vertical
                childAspectRatio: 2.2, // Proporção largura/altura dos itens
              ),
              itemCount:
                  restaurantProvider.categories.length, // Quantidade de itens
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: AppColors.primaryAlternative,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    restaurantProvider.categories[index],
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                );
              },
            ),
            SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }
}
