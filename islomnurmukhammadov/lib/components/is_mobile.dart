import 'package:flutter/material.dart';

bool isTablet(BuildContext context) {
  final size = MediaQuery.of(context).size;
  // ignore: unused_local_variable
  return size.width >= 600 && size.width < 1000;
}

bool isMobile(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  return width < 600; // 600px dan kichik bo'lsa, telefon deb hisoblaymiz
}

double getResponsiveScale(BuildContext context, final size) {
  final width = MediaQuery.of(context).size.width;

  if (width >= 1024) {
    return size * 1.3; // Desktop
  } else if (width >= 600) {
    return size * 1.1; // Tablet
  } else {
    return size * 1.0; // Mobile
  }
}

double mediaWidth(BuildContext context, double size) {
  // Example implementation: just return the size as double

  return MediaQuery.of(context).size.width * size;
}

double mediaHeight(BuildContext context, double size) {
  // Example implementation: just return the size as double

  return MediaQuery.of(context).size.height * size;
}
