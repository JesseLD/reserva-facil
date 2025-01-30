import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reservafacil_app/common/constants/app_text_styles.dart';
import 'package:reservafacil_app/features/restaurant/logic/providers/restaurant_provider.dart';
import 'package:reservafacil_app/features/restaurant/presentation/widgets/restaurant_tile.dart';
import 'package:reservafacil_app/features/restaurant/presentation/widgets/slides_widget.dart';

class RestaurantMobile extends StatefulWidget {
  const RestaurantMobile({super.key});

  @override
  State<RestaurantMobile> createState() => _RestaurantMobileState();
}

class _RestaurantMobileState extends State<RestaurantMobile> {
  @override
  Widget build(BuildContext context) {
    final restaurantProvider = Provider.of<RestaurantProvider>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 48,
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
                    'Lojas',
                    style: AppTextStyles.subtitle,
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: restaurantProvider.restaurants.length,
                itemBuilder: (context, index) {
                  return RestaurantTile(
                    restaurant: restaurantProvider.restaurants[index],
                  );
                },
              ),
              SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
