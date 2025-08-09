import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islomnurmukhammadov/components/is_mobile.dart';
import 'package:islomnurmukhammadov/components/page_animations.dart';
import 'package:islomnurmukhammadov/pages/home_page.dart';
import 'package:lottie/lottie.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).push(FadeRoute(page: const HomePage()));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // 🎨 Yumshoq gradient orqa fon
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF1C1C1E), Color(0xFF2C2C2E)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Center(
            child: LottieBuilder.asset(
              "assets/animations/welcome.json",
              width: getResponsiveScale(context, 260),
            ),
          ),
        ],
      ),
    );
  }
}
