import 'dart:async';
import 'package:flutter/material.dart';
import 'package:islomjonnurmukhammadov/components/size.dart';
import 'package:islomjonnurmukhammadov/pages/home_page.dart';
import 'package:lottie/lottie.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadAssetsAndNavigate();
    });
  }

  Future<void> _loadAssetsAndNavigate() async {
    try {
      // Rasm(lar)ni oldindan yuklash
      await precacheImage(
        const AssetImage('assets/images/bg_win.png'),
        context,
      );

      // 1–2 soniya kutish (ko'rinishi uchun)
      await Future.delayed(const Duration(seconds: 2));

      // Navigatsiya qilish
      if (!mounted) return;
      Navigator.of(context).pushReplacement(_createRoute());
    } catch (e) {
      debugPrint("Xatolik asset yuklashda: $e");
    }
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const HomePage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation
            .drive(CurveTween(curve: Curves.easeInOut))
            .drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
      transitionDuration: const Duration(milliseconds: 600),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF9F9F9), Color(0xFFFFFFFF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Lottie.asset(
            "assets/animations/loading.json",
            width: getResponsiveSize(context, 350),
          ),
        ),
      ),
    );
  }
}
