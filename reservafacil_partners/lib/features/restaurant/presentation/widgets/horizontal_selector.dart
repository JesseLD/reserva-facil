// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reservafacil_partners/common/constants/app_colors.dart';
import 'package:reservafacil_partners/features/restaurant/logic/providers/restaurant_provider.dart';

class HorizontalSelector extends StatefulWidget {
  const HorizontalSelector({super.key});

  @override
  State<HorizontalSelector> createState() => _HorizontalSelectorState();
}

class _HorizontalSelectorState extends State<HorizontalSelector> {
  int listIndex = 0;
  List<String> _items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final restaurantProvider =
        Provider.of<RestaurantProvider>(context, listen: false);

    _items = restaurantProvider.categories;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      // alignment: Alignment.center,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                listIndex = index;
              });
            },
            child: HorizontalTile(
              name: _items[index],
              isSelected: listIndex == index,
            ),
          );
        },
      ),
    );
  }
}

class HorizontalTile extends StatelessWidget {
  String name;
  bool isSelected;
  HorizontalTile({
    super.key,
    required this.name,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: isSelected ? AppColors.primaryAlternative : Colors.grey[200],
      ),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Text(
          name,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
