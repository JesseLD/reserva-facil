import 'package:flutter/material.dart';
import 'package:reservafacil_app/common/constants/app_text_styles.dart';
import 'package:reservafacil_app/features/restaurant/presentation/widgets/slides_widget.dart';

class RestaurantMobile extends StatefulWidget {
  const RestaurantMobile({super.key});

  @override
  State<RestaurantMobile> createState() => _RestaurantMobileState();
}

class _RestaurantMobileState extends State<RestaurantMobile> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 24,
            ),
            SizedBox(
              width: 400,
              height: 260,
              child: SlidesWidget(),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Text(
                  'Restaurantes',
                  style: AppTextStyles.subtitle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
