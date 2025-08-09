import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islomnurmukhammadov/components/is_mobile.dart';
import 'package:islomnurmukhammadov/components/night_image.dart';
import 'package:islomnurmukhammadov/pages/my_sertifikat_fizika.dart';
import 'package:islomnurmukhammadov/pages/my_sertifikat_page_math.dart';

class SertificatsWidget extends StatefulWidget {
  const SertificatsWidget({super.key});

  @override
  State<SertificatsWidget> createState() => _SertificatsWidgetState();
}

class _SertificatsWidgetState extends State<SertificatsWidget> {
  void openNextPage(BuildContext context, Widget thePage) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 800),
        pageBuilder: (context, animation, secondaryAnimation) => thePage,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final offsetAnimation =
              Tween<Offset>(
                begin: const Offset(0, 0.2),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
              );

          final fadeAnimation = Tween<double>(
            begin: 0,
            end: 1,
          ).animate(CurvedAnimation(parent: animation, curve: Curves.easeIn));

          return SlideTransition(
            position: offsetAnimation,
            child: FadeTransition(opacity: fadeAnimation, child: child),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "My certificates",
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: getResponsiveScale(context, 28),
          ),
        ),
        SizedBox(height: isMobile(context) ? 50 : 80),
        isMobile(context)
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    splashColor: Colors.transparent, // splashni yo'qotish
                    highlightColor: Colors.transparent,
                    onTap: () {
                      openNextPage(context, MySertifikatPageMath());
                    },
                    child: CreativeNightImage(
                      image_asset: "assets/images/math.png",
                      width_size: MediaQuery.of(context).size.width * 0.7,
                    ),
                  ),
                  SizedBox(height: 40),
                  InkWell(
                    splashColor: Colors.transparent, // splashni yo'qotish
                    highlightColor: Colors.transparent,
                    onTap: () {
                      openNextPage(context, MySertifikatPageFizika());
                    },
                    child: CreativeNightImage(
                      image_asset: "assets/images/fizika.png",
                      width_size: MediaQuery.of(context).size.width * 0.7,
                    ),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    splashColor: Colors.transparent, // splashni yo'qotish
                    highlightColor: Colors.transparent,
                    onTap: () {
                      openNextPage(context, MySertifikatPageMath());
                    },
                    child: CreativeNightImage(
                      image_asset: "assets/images/math.png",
                      width_size: MediaQuery.of(context).size.width * 0.2,
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent, // splashni yo'qotish
                    highlightColor: Colors.transparent,
                    onTap: () {
                      openNextPage(context, MySertifikatPageFizika());
                    },
                    child: CreativeNightImage(
                      image_asset: "assets/images/fizika.png",
                      width_size: MediaQuery.of(context).size.width * 0.2,
                    ),
                  ),
                ],
              ),

        SizedBox(height: 60),
      ],
    );
  }
}
