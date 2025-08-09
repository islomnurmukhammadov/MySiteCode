// ignore_for_file: non_constant_identifier_names

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islomnurmukhammadov/components/is_mobile.dart';

class MySertifikatPageMath extends StatefulWidget {
  // ignore: duplicate_ignore
  // ignore: non_constant_identifier_names
  const MySertifikatPageMath({super.key});

  @override
  State<MySertifikatPageMath> createState() => _MySertifikatPageMathState();
}

class _MySertifikatPageMathState extends State<MySertifikatPageMath> {
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
                      "Sertifikatlarim",
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
              child: MediaQuery.of(context).size.width <= 1250
                  ? Padding(
                      padding: const EdgeInsets.only(
                        left: 30,
                        right: 30,
                        top: 45,
                        bottom: 45,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
                          child: Container(
                            width: mediaWidth(context, 0.9),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(
                                0.15,
                              ), // Shaffof oq rang
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.2),
                                width: 1.0,
                              ),
                            ),
                            child: Column(
                              children: [
                                Image.asset("assets/images/math.png"),
                                // SizedBox(height: 30),
                                Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "Familiyasi:  ",
                                              style: GoogleFonts.montserrat(
                                                color: Colors.white54,
                                                fontSize: 15,
                                              ),
                                            ),
                                            TextSpan(
                                              text: "NURMUHAMMADOV",
                                              style: GoogleFonts.montserrat(
                                                color: Colors.white,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "Ismi:  ",
                                              style: GoogleFonts.montserrat(
                                                color: Colors.white54,
                                                fontSize: 14,
                                              ),
                                            ),
                                            TextSpan(
                                              text: "ISLOMJON",
                                              style: GoogleFonts.montserrat(
                                                color: Colors.white,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "Otasining ismi:  ",
                                              style: GoogleFonts.montserrat(
                                                color: Colors.white54,
                                                fontSize: 14,
                                              ),
                                            ),
                                            TextSpan(
                                              text: "TO'XTAMUROD O'G'LI",
                                              style: GoogleFonts.montserrat(
                                                color: Colors.white,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Container(
                                        height: 1,
                                        width:
                                            MediaQuery.of(context).size.width <=
                                                1200
                                            ? mediaWidth(context, 0.3)
                                            : mediaWidth(context, 0.5),
                                        color: Colors.white70,
                                        margin: const EdgeInsets.symmetric(
                                          vertical: 8,
                                        ),
                                      ),

                                      SizedBox(height: 10),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "Umumtaʼlim fani:  ",
                                              style: GoogleFonts.montserrat(
                                                color: Colors.white54,
                                                fontSize: 14,
                                              ),
                                            ),
                                            TextSpan(
                                              text: "Matematika (O'zbek)",
                                              style: GoogleFonts.montserrat(
                                                color: Colors.white,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "Umumiy to‘plagan bali:  ",
                                              style: GoogleFonts.montserrat(
                                                color: Colors.white54,
                                                fontSize: 14,
                                              ),
                                            ),
                                            TextSpan(
                                              text: "56.9",
                                              style: GoogleFonts.montserrat(
                                                color: Colors.white,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text:
                                                  "Umumiy ballga nisbatan foiz ko‘rsatkichi:  ",
                                              style: GoogleFonts.montserrat(
                                                color: Colors.white54,
                                                fontSize: 14,
                                              ),
                                            ),
                                            TextSpan(
                                              text: "87.54 %",
                                              style: GoogleFonts.montserrat(
                                                color: Colors.white,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "Sertifikat darajasi:  ",
                                              style: GoogleFonts.montserrat(
                                                color: Colors.white54,
                                                fontSize: 14,
                                              ),
                                            ),
                                            TextSpan(
                                              text: "B",
                                              style: GoogleFonts.montserrat(
                                                color: Colors.white,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 30),
                                      Text(
                                        "Bo‘limlar bo‘yicha test sinovi natijalari:",
                                        style: GoogleFonts.montserrat(
                                          color: const Color.fromARGB(
                                            255,
                                            255,
                                            255,
                                            255,
                                          ),
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(height: 15),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text:
                                                  "Algebra va matematik analiz asoslari:  ",
                                              style: GoogleFonts.montserrat(
                                                color: Colors.white54,
                                                fontSize: 14,
                                              ),
                                            ),
                                            TextSpan(
                                              text: "40.968",
                                              style: GoogleFonts.montserrat(
                                                color: Colors.white,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "Geometriya:  ",
                                              style: GoogleFonts.montserrat(
                                                color: Colors.white54,
                                                fontSize: 14,
                                              ),
                                            ),
                                            TextSpan(
                                              text: "15.932",
                                              style: GoogleFonts.montserrat(
                                                color: Colors.white,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 60),
                                      Container(
                                        height: 1,
                                        width:
                                            MediaQuery.of(context).size.width <=
                                                1200
                                            ? mediaWidth(context, 0.3)
                                            : mediaWidth(context, 0.5),
                                        color: Colors.white70,
                                        margin: const EdgeInsets.symmetric(
                                          vertical: 8,
                                        ),
                                      ),
                                      SizedBox(height: 15),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "Berilgan sanasi:  ",
                                              style: GoogleFonts.montserrat(
                                                color: Colors.white54,
                                                fontSize: 14,
                                              ),
                                            ),
                                            TextSpan(
                                              text: "20.03.2025",
                                              style: GoogleFonts.montserrat(
                                                color: Colors.white,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "Amal qilish muddati:  ",
                                              style: GoogleFonts.montserrat(
                                                color: Colors.white54,
                                                fontSize: 15,
                                              ),
                                            ),
                                            TextSpan(
                                              text: "19.03.2028",
                                              style: GoogleFonts.montserrat(
                                                color: Colors.white,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(
                        left: 60.0,
                        right: 60,
                        top: 45,
                        bottom: 45,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
                          child: Container(
                            width: mediaWidth(context, 0.9),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(
                                0.15,
                              ), // Shaffof oq rang
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.2),
                                width: 1.0,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "assets/images/math.png",
                                  height: 600,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 30.0,
                                    vertical: 30,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "Familiyasi:  ",
                                              style: GoogleFonts.montserrat(
                                                color: Colors.white54,
                                                fontSize: 18,
                                              ),
                                            ),
                                            TextSpan(
                                              text: "NURMUHAMMADOV",
                                              style: GoogleFonts.montserrat(
                                                color: Colors.white,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "Ismi:  ",
                                              style: GoogleFonts.montserrat(
                                                color: Colors.white54,
                                                fontSize: 18,
                                              ),
                                            ),
                                            TextSpan(
                                              text: "ISLOMJON",
                                              style: GoogleFonts.montserrat(
                                                color: Colors.white,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "Otasining ismi:  ",
                                              style: GoogleFonts.montserrat(
                                                color: Colors.white54,
                                                fontSize: 18,
                                              ),
                                            ),
                                            TextSpan(
                                              text: "TO'XTAMUROD O'G'LI",
                                              style: GoogleFonts.montserrat(
                                                color: Colors.white,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Container(
                                        height: 1,
                                        width:
                                            MediaQuery.of(context).size.width <=
                                                1200
                                            ? mediaWidth(context, 0.3)
                                            : mediaWidth(context, 0.5),
                                        color: Colors.white70,
                                        margin: const EdgeInsets.symmetric(
                                          vertical: 8,
                                        ),
                                      ),

                                      SizedBox(height: 10),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "Umumtaʼlim fani:  ",
                                              style: GoogleFonts.montserrat(
                                                color: Colors.white54,
                                                fontSize: 18,
                                              ),
                                            ),
                                            TextSpan(
                                              text: "Matematika (O'zbek)",
                                              style: GoogleFonts.montserrat(
                                                color: Colors.white,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "Umumiy to‘plagan bali:  ",
                                              style: GoogleFonts.montserrat(
                                                color: Colors.white54,
                                                fontSize: 18,
                                              ),
                                            ),
                                            TextSpan(
                                              text: "56.9",
                                              style: GoogleFonts.montserrat(
                                                color: Colors.white,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text:
                                                  "Umumiy ballga nisbatan foiz ko‘rsatkichi:  ",
                                              style: GoogleFonts.montserrat(
                                                color: Colors.white54,
                                                fontSize: 18,
                                              ),
                                            ),
                                            TextSpan(
                                              text: "87.54 %",
                                              style: GoogleFonts.montserrat(
                                                color: Colors.white,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "Sertifikat darajasi:  ",
                                              style: GoogleFonts.montserrat(
                                                color: Colors.white54,
                                                fontSize: 18,
                                              ),
                                            ),
                                            TextSpan(
                                              text: "B",
                                              style: GoogleFonts.montserrat(
                                                color: Colors.white,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 30),
                                      Text(
                                        "Bo‘limlar bo‘yicha test sinovi natijalari:",
                                        style: GoogleFonts.montserrat(
                                          color: const Color.fromARGB(
                                            255,
                                            255,
                                            255,
                                            255,
                                          ),
                                          fontSize: 18,
                                        ),
                                      ),
                                      SizedBox(height: 15),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text:
                                                  "Algebra va matematik analiz asoslari:  ",
                                              style: GoogleFonts.montserrat(
                                                color: Colors.white54,
                                                fontSize: 18,
                                              ),
                                            ),
                                            TextSpan(
                                              text: "40.968",
                                              style: GoogleFonts.montserrat(
                                                color: Colors.white,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "Geometriya:  ",
                                              style: GoogleFonts.montserrat(
                                                color: Colors.white54,
                                                fontSize: 18,
                                              ),
                                            ),
                                            TextSpan(
                                              text: "15.932",
                                              style: GoogleFonts.montserrat(
                                                color: Colors.white,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 60),
                                      Container(
                                        height: 1,
                                        width:
                                            MediaQuery.of(context).size.width <=
                                                1200
                                            ? mediaWidth(context, 0.3)
                                            : mediaWidth(context, 0.5),
                                        color: Colors.white70,
                                        margin: const EdgeInsets.symmetric(
                                          vertical: 8,
                                        ),
                                      ),
                                      SizedBox(height: 15),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "Berilgan sanasi:  ",
                                              style: GoogleFonts.montserrat(
                                                color: Colors.white54,
                                                fontSize: 18,
                                              ),
                                            ),
                                            TextSpan(
                                              text: "20.03.2025",
                                              style: GoogleFonts.montserrat(
                                                color: Colors.white,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "Amal qilish muddati:  ",
                                              style: GoogleFonts.montserrat(
                                                color: Colors.white54,
                                                fontSize: 18,
                                              ),
                                            ),
                                            TextSpan(
                                              text: "19.03.2028",
                                              style: GoogleFonts.montserrat(
                                                color: Colors.white,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
