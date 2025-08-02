import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class FreeCoursesPage extends StatefulWidget {
  const FreeCoursesPage({super.key});

  @override
  State<FreeCoursesPage> createState() => _FreeCoursesPageState();
}

class _FreeCoursesPageState extends State<FreeCoursesPage> {
  int? ochiqIndex;

  final List<Map<String, String>> mavzular = [
    {
      'title': 'C++ dasturlash tili',
      'content':
          "C++ dasturlash tilini bepulga o'rganing. Darslar Bobobek Turdiyev tomonidan ishlab chiqilgan.",
      'link':
          "https://youtube.com/playlist?list=PLY4N-4FJdZQCzjRxjFfHQ57xAYvKmk2Yo&si=XHbQcHzBeKQ5xZSO",
    },
    {
      'title': 'Python dasturlash tili',
      'content':
          'Python dasturlash tilini bepulga o\'rganing. Darslar Anvar Narzullaev tomonidan ishlab chiqilgan.',
      'link':
          "https://youtube.com/playlist?list=PLwsopmzfbOn9Lw5D7a26THpBDgAma1Sus&si=ZhnGLeuaf8-ChoCs",
    },
    {
      'title': 'Php dasturlash tili',
      'content':
          'Php dasturlash tilini bepulga o\'rganing. Darslar Bobobek Turdiyev tomonidan ishlab chiqilgan.',
      'link':
          "https://youtube.com/playlist?list=PLY4N-4FJdZQDu2HFOhl0S-yft-AgjixAE&si=njm-smDLBTSLrRko",
    },
    {
      'title': 'Telegram bot yaratish',
      'content':
          'Telegram botlarni yaratishni bepulga o\'rganing. Darslar Anvar Narzullaev tomonidan ishlab chiqilgan.',
      'link':
          "https://youtube.com/playlist?list=PLwsopmzfbOn8x3CJKdQLtqDKhaF8n2r_7&si=UvUePnxMZUiu8mYE",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Center(
                child: Text(
                  "BEPULGA DASTURLASHNI O'RGANING",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    fontSize: isMobile ? 17 : 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              ...List.generate(mavzular.length, (index) {
                final isOpen = ochiqIndex == index;
                final mavzu = mavzular[index];

                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      dividerColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: ExpansionTile(
                        key: Key(index.toString()),
                        tilePadding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        childrenPadding: const EdgeInsets.fromLTRB(
                          20,
                          0,
                          20,
                          20,
                        ),
                        title: Text(
                          mavzu['title']!,
                          style: GoogleFonts.montserrat(
                            fontSize: isMobile ? 15 : 17,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 42, 42, 42),
                          ),
                        ),
                        backgroundColor: Colors.grey.shade200,
                        collapsedBackgroundColor: Colors.grey.shade200,
                        onExpansionChanged: (expanded) {
                          setState(() {
                            ochiqIndex = expanded ? index : null;
                          });
                        },
                        initiallyExpanded: isOpen,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                mavzu['content']!,
                                style: GoogleFonts.afacad(
                                  fontSize: isMobile ? 14 : 16,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 14),

                          /// ROW: Boshlash tugmasi + play icon
                          GestureDetector(
                            onTap: () async {
                              final url = Uri.parse(mavzu['link']!);
                              if (await canLaunchUrl(url)) {
                                final isMobile =
                                    Theme.of(context).platform ==
                                        TargetPlatform.android ||
                                    Theme.of(context).platform ==
                                        TargetPlatform.iOS;

                                await launchUrl(
                                  url,
                                  mode: isMobile
                                      ? LaunchMode.externalApplication
                                      : LaunchMode.platformDefault,
                                );
                              }
                            },
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    // horizontal: 16,
                                    vertical: 10,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.play_circle_fill,
                                        color: Colors.blue,
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        "Boshlash",
                                        style: GoogleFonts.poppins(
                                          color: Colors.blue,
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
                );
              }),

              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
