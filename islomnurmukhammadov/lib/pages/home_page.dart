import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islomnurmukhammadov/components/carousel_slider.dart';
import 'package:islomnurmukhammadov/components/certifacts.dart';
import 'package:islomnurmukhammadov/components/is_mobile.dart';
import 'package:islomnurmukhammadov/components/social_icons.dart';
import 'package:islomnurmukhammadov/components/two_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1E),
      body: Stack(
        children: [
          // Orqa fon
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF1C1C1E), Color(0xFF2C2C2E)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // Blur AppBar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
                child: Container(
                  height: kToolbarHeight + MediaQuery.of(context).padding.top,
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.white.withOpacity(0.08),
                        width: 0.5,
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Islom Nurmukhammadov",
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: getResponsiveScale(context, 20),
                        color: Colors.white.withOpacity(0.9),
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Kontent
          Positioned.fill(
            top: kToolbarHeight + MediaQuery.of(context).padding.top,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: isMobile(context)
                        ? MediaQuery.of(context).size.height * 0.13
                        : MediaQuery.of(context).size.height * 0.25,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile(context) ? 25 : 50,
                    ),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          textSpan("Hello, I am a ", Colors.white),
                          textSpan("Mobile ", const Color(0xFFB7A9A9)),
                          textSpan("and ", Colors.white),
                          textSpan("Web ", const Color(0xFFB7A9A9)),
                          textSpan(
                            "developer with 3 years of experience. ",
                            Colors.white,
                          ),
                          textSpan("Flutter, ", const Color(0xFFB7A9A9)),
                          textSpan("Frontend ", const Color(0xFFB7A9A9)),
                          textSpan("and ", Colors.white),
                          textSpan("Python ", const Color(0xFFB7A9A9)),
                          textSpan("developer.", Colors.white),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Rasm qismi
                  TwoImageWidget(),

                  SizedBox(
                    height: isMobile(context)
                        ? MediaQuery.of(context).size.height * 0.25
                        : MediaQuery.of(context).size.height * 0.4,
                  ),
                  SertificatsWidget(),
                  SizedBox(height: 60),
                  Text(
                    textAlign: TextAlign.start,
                    "My experiences",
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: getResponsiveScale(context, 25),
                    ),
                  ),
                  SizedBox(height: 70),
                  FancyCarousel(),
                  SizedBox(height: 90),
                  SocialIcons(),
                  SizedBox(height: 60),
                  Text(
                    '© 2025 Islom Nurmukhammadov. All rights reserved.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: isMobile(context) ? 12 : 16,
                      color: Colors.white54,
                    ),
                  ),
                  SizedBox(height: 45),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextSpan textSpan(String text, Color color) {
    return TextSpan(
      text: text,
      style: GoogleFonts.poppins(
        color: color,
        fontSize: isTablet(context)
            ? 35
            : isMobile(context)
            ? 28
            : 40,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
