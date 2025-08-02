import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islomjonnurmukhammadov/pages/free_courses_page.dart';

class FreeCourses extends StatelessWidget {
  const FreeCourses({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFF0F8FF), // pastel light blue
            Color(0xFFE6F2F5), // almost white
            Color(0xFFDFF4F8), // subtle bluish glass tone
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 80),
          Padding(
            padding: EdgeInsets.all(isMobile ? 25 : 100),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 30 : 60,
                vertical: isMobile ? 40 : 80,
              ),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF00284D), // quyuq ko‘k
                    Color(0xFF004E89), // ochroq ko‘k
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.all(Radius.circular(28)),
              ),
              child: isMobile
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTexts(context),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(width: 20),
                            Image.asset(
                              'assets/icons/tutorial.png',
                              width: 220,
                            ),
                          ],
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        Expanded(child: _buildTexts(context)),
                        const SizedBox(width: 40),
                        Image.asset('assets/icons/tutorial.png', width: 280),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTexts(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "ISLOM NURMUKHAMMADOV",
          style: GoogleFonts.afacad(
            fontSize: 14,
            color: Colors.blue[100],
            letterSpacing: 1.2,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          "Bepulga ham dasturlashni o'rganish mumkinmi?",
          style: GoogleFonts.montserrat(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            height: 1.3,
          ),
        ),
        const SizedBox(height: 24),
        TextButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 500),
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const FreeCoursesPage(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                      return FadeTransition(opacity: animation, child: child);
                    },
              ),
            );
          },
          icon: const Icon(Icons.play_circle_fill, color: Colors.white),
          label: Text(
            "Bepul video darslar",
            style: GoogleFonts.poppins(color: Colors.white, fontSize: 14),
          ),
          style: TextButton.styleFrom(
            backgroundColor: const Color(0xFF3D8BFF),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
