import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islomjonnurmukhammadov/components/size.dart';

class AboutMeWidget extends StatefulWidget {
  const AboutMeWidget({super.key});

  @override
  State<AboutMeWidget> createState() => _AboutMeWidgetState();
}

class _AboutMeWidgetState extends State<AboutMeWidget> {
  int _currentPage = 0;

  final List<Map<String, String>> students = [
    {
      'name': 'Flutter',
      'content': "Mobile, web, desktop ilovalarni yaratish.",
      'daraja': "Middle",
      'tajriba': "2 yildan ortiq",
      'image': 'assets/images/flutter.png',
    },
    {
      'name': 'Android',
      'content': "Android uchun dasturlash yaratish.",
      'daraja': "Junior",
      'tajriba': "1.5 yildan ortiq",
      'image': 'assets/images/android.png',
    },
    {
      'name': 'IOS',
      'content': "IPhone va IPad uchun dasturlar yaratish.",
      'daraja': "Beginner",
      'tajriba': "1 yildan ortiq",
      'image': 'assets/images/ios.png',
    },
    {
      'name': 'WebSite',
      'content': "Turli xil web saytlarni yaratish",
      'daraja': "Middle",
      'tajriba': "2.5 yildan ortiq",
      'image': 'assets/images/web.png',
    },
    {
      'name': 'Python',
      'content': "O'yinlar, telegram bot va serverlar narsalar yaratish",
      'daraja': "Middle",
      'tajriba': "2 yildan ortiq",
      'image': 'assets/images/python.png',
    },
  ];

  void _nextPage(PageController controller) {
    if (_currentPage < students.length - 1) {
      _currentPage++;
      controller.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void _prevPage(PageController controller) {
    if (_currentPage > 0) {
      _currentPage--;
      controller.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text(
              "Yo'nalishlarim",
              style: GoogleFonts.montserrat(
                fontSize: getResponsiveSize(context, 26),
                fontWeight: FontWeight.bold,
                color: const Color(0xFF0F172A),
              ),
            ),
          ),
          const SizedBox(height: 24),
          LayoutBuilder(
            builder: (context, constraints) {
              // ignore: unused_local_variable
              final isMobile = constraints.maxWidth < 600;
              final controller = PageController(
                viewportFraction: 1.0,
                initialPage: _currentPage,
              );

              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFF1F5F9),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back_ios_new_rounded),
                          onPressed: () => _prevPage(controller),
                          iconSize: 18,
                          padding: const EdgeInsets.all(12),
                          splashRadius: 24,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFF1F5F9),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.arrow_forward_ios_rounded),
                          onPressed: () => _nextPage(controller),
                          iconSize: 18,
                          padding: const EdgeInsets.all(12),
                          splashRadius: 24,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    height: 360,
                    width: constraints.maxWidth * 0.7,
                    child: PageView.builder(
                      controller: controller,
                      itemCount: students.length,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        final student = students[index];
                        return _buildStudentCard(
                          name: student['name']!,
                          course: student['content']!,
                          imagePath: student['image']!,
                          daraja: student['daraja']!,
                          tajriba: student['tajriba']!,
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildStudentCard({
    required String name,
    required String course,
    required String imagePath,
    required String daraja,
    required String tajriba,
  }) {
    return Center(
      child: Container(
        width: 260,
        decoration: BoxDecoration(
          color: const Color(0xFFF8FBFF),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              height: 180,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 242, 244, 245),
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Image.asset(
                imagePath,
                width: 100,
                height: 100,
                fit: BoxFit.contain,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              width: double.infinity,
              decoration: const BoxDecoration(
                // color: Color(0xFFF9F9F9),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                      color: const Color(0xFF0F172A),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    course,
                    style: GoogleFonts.afacad(
                      fontSize: 15,
                      color: Colors.grey[700],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Tajriba: $tajriba",
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 25, 116, 243),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Daraja: $daraja",
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 4, 234, 142),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
