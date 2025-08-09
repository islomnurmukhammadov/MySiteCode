import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:islomnurmukhammadov/components/is_mobile.dart';

class FancyCarousel extends StatefulWidget {
  const FancyCarousel({super.key});

  @override
  State<FancyCarousel> createState() => _FancyCarouselState();
}

class _FancyCarouselState extends State<FancyCarousel> {
  int currentIndex = 0;

  final List<String> imagePaths = List.generate(
    8,
    (i) => 'assets/icons/icons${i + 1}.png',
  );
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: imagePaths.length,
      itemBuilder: (context, index, realIndex) {
        final bool isSelected = index == currentIndex;

        return Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: isMobile(context)
                ? isSelected
                      ? 90
                      : 80
                : isSelected
                ? 130
                : 120,
            height: isMobile(context)
                ? isSelected
                      ? 90
                      : 80
                : isSelected
                ? 130
                : 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Colors.white.withOpacity(isSelected ? 0.1 : 0.05),
              border: Border.all(
                color: isSelected
                    ? Colors.blueAccent.withOpacity(0.4)
                    : Colors.white.withOpacity(0.1),
                width: isSelected ? 1.5 : 1,
              ),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: Colors.blueAccent.withOpacity(0.3),
                        blurRadius: 8,
                        spreadRadius: 1,
                      ),
                    ]
                  : [],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Center(
                  child:Image.asset(imagePaths[index],fit: BoxFit.contain,)
                ),
              ),
            ),
          ),
        );
      },
      options: CarouselOptions(
        height: isMobile(context) ? 90 : 130,
        viewportFraction: 0.3,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 2),
        enableInfiniteScroll: true,
        enlargeCenterPage: true,
        onPageChanged: (index, reason) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
