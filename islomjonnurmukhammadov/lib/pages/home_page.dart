import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islomjonnurmukhammadov/components/about_me.dart';
import 'package:islomjonnurmukhammadov/components/free_courses.dart';
import 'package:islomjonnurmukhammadov/components/glass_button.dart';
import 'package:islomjonnurmukhammadov/components/size.dart';
import 'package:islomjonnurmukhammadov/components/social_row.dart';
import 'package:islomjonnurmukhammadov/components/teachers.dart';
import 'package:islomjonnurmukhammadov/pages/yonalish_tanlash.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: ClipRRect(
          // Rounded corners agar xohlasangiz
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: AppBar(
              backgroundColor: Colors.white.withOpacity(0.05),
              elevation: 0,
              title: Text(
                'ISLOM NURMUKHAMMADOV',
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: getResponsiveSize(context, 16),
                  fontWeight: FontWeight.w500,
                ),
              ),
              centerTitle: true,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 🔝 Fullscreen blur hero section
            SizedBox(
              height: size.height,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Background image
                  Stack(
                    fit: StackFit.expand,
                    children: [
                      // Rasm
                      Image.asset(
                        'assets/images/bg_win.png',
                        fit: BoxFit.cover,
                      ),

                      // Qoraytiruvchi qatlam (dark overlay)
                      Container(
                        color: Colors.black.withOpacity(
                          0.4,
                        ), // 0.2–0.5 orasida bo‘lishi mumkin
                      ),

                      // Blur yoki matnlar
                      BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                        child: Container(color: Colors.white.withOpacity(0.05)),
                      ),

                      // Matnlar ustida
                      Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text(
                              'Salom!',
                              style: TextStyle(
                                fontSize: 32,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // Blur overlay
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
                    child: Container(color: Colors.white.withOpacity(0.05)),
                  ),

                  // Content
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Assalomu alaykum!',
                          style: GoogleFonts.montserrat(
                            fontSize: getResponsiveSize(context, 30),
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: getResponsiveSize(context, 20),
                          ),
                          child: Text(
                            "Mening ismim Islom va men Flutter dasturchisiman. Men 3 yildan buyon dasturlash yo'nalishidaman",
                            style: GoogleFonts.afacad(
                              fontSize: getResponsiveSize(context, 17),
                              color: Colors.white70,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),

                        SizedBox(height: 20),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: getResponsiveSize(context, 20),
                          ),
                          child: GlassButton(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  transitionDuration: const Duration(
                                    milliseconds: 500,
                                  ),
                                  pageBuilder:
                                      (
                                        context,
                                        animation,
                                        secondaryAnimation,
                                      ) => const YonalishTanlashPage(),
                                  transitionsBuilder:
                                      (
                                        context,
                                        animation,
                                        secondaryAnimation,
                                        child,
                                      ) {
                                        return FadeTransition(
                                          opacity: animation,
                                          child: child,
                                        );
                                      },
                                ),
                              );
                            },
                            child: Text(
                              "Yo'nalish tanlay olmayapsizmi?",
                              style: GoogleFonts.afacad(
                                color: Colors.white,
                                fontSize: getResponsiveSize(context, 17),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            GlassCardRow(),
            FreeCourses(),
            SizedBox(height: 60),
            AboutMeWidget(),
            SizedBox(height: 60),
            SocialMediaRow(),
            SizedBox(height: 30),
            Text(
              'Islom Nurmukhammadov ©. All rights reserved.',
              style: GoogleFonts.montserrat(color: Colors.grey),
            ),

            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
