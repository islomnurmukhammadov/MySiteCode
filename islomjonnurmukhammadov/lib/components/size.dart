// lib/utils/responsive_helper.dart

import 'package:flutter/material.dart';

double getResponsiveSize(BuildContext context, double baseSize) {
  double width = MediaQuery.of(context).size.width;
  if (width > 1000) {
    return baseSize * 1.2; // katta ekran
  } else if (width > 600) {
    return baseSize * 1.1; // planshet
  } else {
    return baseSize; // telefon
  }
}
