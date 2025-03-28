import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reservafacil_app/common/constants/app_text_styles.dart';
import 'package:reservafacil_app/common/utils/logger.dart';
import 'package:reservafacil_app/common/widgets/dynamic_spacer.dart';
import 'package:reservafacil_app/features/restaurant/logic/providers/restaurant_provider.dart';
import 'package:reservafacil_app/features/restaurant/presentation/widgets/horizontal_selector.dart';
import 'package:reservafacil_app/features/restaurant/presentation/widgets/restaurant_tile.dart';
import 'package:reservafacil_app/features/restaurant/presentation/widgets/slides_widget.dart';

class RestaurantMobile extends StatefulWidget {
  const RestaurantMobile({super.key});

  @override
  State<RestaurantMobile> createState() => _RestaurantMobileState();
}

class _RestaurantMobileState extends State<RestaurantMobile> {
  late Future<void> restaurantsFuture;

  @override
  void initState() {
    super.initState();

    final restaurantProvider =
        Provider.of<RestaurantProvider>(context, listen: false);
    restaurantsFuture = restaurantProvider.getRestaurants();
  }

  @override
  Widget build(BuildContext context) {
    final restaurantProvider = Provider.of<RestaurantProvider>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              DynamicSpacer(),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.3,
                child: SlidesWidget(),
              ),
              SizedBox(
                height: 16,
              ),
              // HorizontalSelector(),
              // SizedBox(
              //   height: 16,
              // ),
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
              FutureBuilder(
                  future: restaurantsFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    }
                    if (snapshot.hasError) {
                      Logger.log('${snapshot.error}');
                      return Center(
                        child: Text('Erro ao buscar restaurantes'),
                      );
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: restaurantProvider.restaurants.length,
                      itemBuilder: (context, index) {
                        return RestaurantTile(
                          restaurant: restaurantProvider.restaurants[index],
                        );
                      },
                    );
                  }),
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
