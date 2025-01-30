import 'dart:async';

import 'package:flutter/material.dart';
import 'package:reservafacil_app/common/constants/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SlidesWidget extends StatefulWidget {
  const SlidesWidget({super.key});

  @override
  State<SlidesWidget> createState() => _SlidesWidgetState();
}

class _SlidesWidgetState extends State<SlidesWidget> {
  final _pageController = PageController();
  int _currentPage = 0;

  Timer? _autoPlayTimer;

  final List<String> _images = [
    'http://192.168.1.232:3030/uploads/SLIDE1.PNG',
    'http://192.168.1.232:3030/uploads/SLIDE2.PNG',
    'http://192.168.1.232:3030/uploads/SLIDE3.PNG',
    'http://192.168.1.232:3030/uploads/SLIDE4.PNG',
  ];

  @override
  void initState() {
    super.initState();
    _startAutoPlay();
  }

  void _startAutoPlay() {
    _autoPlayTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        int nextPage = (_currentPage + 1) % _images.length;
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    _autoPlayTimer?.cancel();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: _images.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey[200],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    _images[index],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        SmoothPageIndicator(
          controller: _pageController,
          count: _images.length,
          effect: const ExpandingDotsEffect(
            activeDotColor: AppColors.primaryAlternative,
            dotColor: Colors.grey,
            dotHeight: 10,
            dotWidth: 10,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
