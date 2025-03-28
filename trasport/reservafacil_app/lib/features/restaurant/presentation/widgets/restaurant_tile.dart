// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:reservafacil_app/common/constants/app_colors.dart';
import 'package:reservafacil_app/common/constants/app_custom_text.dart';
import 'package:reservafacil_app/common/constants/app_text_styles.dart';
import 'package:reservafacil_app/common/utils/popups.dart';

import 'package:reservafacil_app/features/restaurant/data/models/restaurant_model.dart';
import 'package:reservafacil_app/features/restaurant/logic/providers/restaurant_provider.dart';

class RestaurantTile extends StatefulWidget {
  final RestaurantModel restaurant;
  const RestaurantTile({
    super.key,
    required this.restaurant,
  });

  @override
  State<RestaurantTile> createState() => _RestaurantTileState();
}

class _RestaurantTileState extends State<RestaurantTile> {
  double opacity = 0.7;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final restaurantProvider =
            Provider.of<RestaurantProvider>(context, listen: false);

        showLoadingPopup(context);

        await restaurantProvider.getRestaurant(widget.restaurant.id);

        Navigator.pop(context);

        Navigator.pushNamed(context, "/restaurant");
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(
            color: AppColors.black.withOpacity(0.1),
            width: 1,
          ),
        )),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              // CircleAvatar(
              //   backgroundImage: NetworkImage(widget.restaurant.logoUrl),
              //   radius: 24,
              // ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.restaurant.name,
                    style: AppTextStyles.button.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Ionicons.star,
                        color: Colors.orangeAccent,
                        size: 12,
                      ),
                      SizedBox(width: 4),
                      Text(
                        widget.restaurant.rating.toString(),
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.black.withOpacity(0.7),
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        " • ",
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.black.withOpacity(0.7),
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        widget.restaurant.category,
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.black.withOpacity(0.7),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.restaurant.priceRangeStart
                            .toString()
                            .replaceAll(".", ","),
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.black.withOpacity(0.7),
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        " ~ ",
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.black.withOpacity(0.7),
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        widget.restaurant.priceRangeEnd
                            .toString()
                            .replaceAll(".", ","),
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.black.withOpacity(0.7),
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        " • ",
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.black.withOpacity(0.7),
                          fontSize: 12,
                        ),
                      ),
                      // Icon(
                      //   Ionicons.people_outline,
                      //   color: AppColors.black.withOpacity(0.8),
                      //   size: 16,
                      // ),
                      // SizedBox(width: 2),
                      Text(
                        "${widget.restaurant.capacity} Lugares",
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.black.withOpacity(0.7),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(child: Container()),
              // widget.restaurant.isFavorite
              //     ? GestureDetector(
              //         onTap: () {
              //           setState(() {
              //             widget.restaurant.isFavorite =
              //                 !widget.restaurant.isFavorite;
              //           });
              //         },
              //         child: Icon(Ionicons.heart, color: Colors.pinkAccent))
              //     : GestureDetector(
              //         onTap: () {
              //           setState(() {
              //             widget.restaurant.isFavorite =
              //                 !widget.restaurant.isFavorite;
              //           });
              //         },
              //         child: Icon(Ionicons.heart_outline, color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}
