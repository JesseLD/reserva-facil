import 'dart:async';

import 'package:flutter/material.dart';
import 'package:reservafacil_partners/common/constants/app_colors.dart';
import 'package:reservafacil_partners/core/network/dio_client.dart';
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

  List<String> _images = [];

  @override
  void initState() {
    super.initState();
    _handleImages();
  }

  void _handleImages() async {
    await _loadImages();
    _startAutoPlay();
  }

  Future<void> _loadImages() async {
    // final response = await _dioClient.get('/slides');
    // if (response.statusCode == 200) {
    //   final data = response.data;
    //   final List<String> images = data['data'].map<String>((item) => item['image']).toList();
    //   setState(() {
    //     _images = images;
    //   });
    // }
    _images = [
      '${DioClient.apiUrl}uploads/BANNERS/SLIDE1.PNG',
      '${DioClient.apiUrl}uploads/BANNERS/SLIDE2.PNG',
      '${DioClient.apiUrl}uploads/BANNERS/SLIDE3.PNG',
      '${DioClient.apiUrl}uploads/BANNERS/SLIDE4.PNG',
    ];
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
            dotColor: AppColors.gray,
            dotHeight: 10,
            dotWidth: 10,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
