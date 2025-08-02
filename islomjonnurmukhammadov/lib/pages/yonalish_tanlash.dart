import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islomjonnurmukhammadov/components/size.dart';
import 'package:url_launcher/url_launcher.dart';

class YonalishTanlashPage extends StatefulWidget {
  const YonalishTanlashPage({super.key});

  @override
  State<YonalishTanlashPage> createState() => _YonalishTanlashPageState();
}

class _YonalishTanlashPageState extends State<YonalishTanlashPage> {
  int? ochiqIndex;

  final List<Map<String, String>> mavzular = [
    {
      'title': 'Web dasturlash',
      'content':
          "Siz YouTube, Instagram kabi web ilovalar yaratishga qiziqasizmi? Unda web dasturlash siz uchun. Atiga 1 - 2 oy o'qib Sodda web saytlaringizni yaratishingiz mumkin. Sizga bunda HTML, CSS, JavaScript yordam beradi. 8 - 9 oyda to'liq frameworklari bilan o'rganishingiz mumkin.",
    },
    {
      'title': 'Flutter dasturlash',
      'content':
          'Atiga dart dasturlash tili va flutter frameworkini o\'rganib, mobil ilovalar yaratishingiz mumkin. 3 - 4 oy ichida oddiy ilovalarni yaratishingiz mumkin. 6 - 7 oyda esa murakkab ilovalarni yaratishingiz mumkin. 11 - 12 oy ichida esa o\'zingizning birinchi ilovangizni App Store va Play Marketga joylashingiz mumkin bo\'ladi.Nafaqat mobil, balki web va desktop ilovalarini ham yaratishingiz mumkin.',
    },
    {
      'title': 'Backend dasturlash',
      'content':
          'Backend dasturlash server tomonini o\'rganishdir. Siz web, mobile ilovalar uchun serverlarni yaratishingiz mumkin. 3 - 4 oy ichida oddiy serverlarni yaratishingiz mumkin. 6 - 7 oyda esa murakkab serverlarni yaratishingiz mumkin. 8-9 oy ichida esa o\'zingizning birinchi serveringizni joylashingiz mumkin bo\'ladi. Backend bu instagram, youtube kabi ilovalar, web saytlarni video, rasm, ma\'lumotlar bazasini saqlash uchun kerak bo\'ladi.',
    },
    {
      'title': 'Mobile dasturlash',
      'content':
          'Bunda siz Android va iOS ilovalarini yaratishingiz mumkin. Faqat endi birdagi emas alohida alohida Android va iOS ilovalarini yaratasiz. Android uchun Java, Kotlin. IOS uchun esa Swift, Objective-C. 3 - 4 oy ichida oddiy ilovalarni yaratishingiz mumkin. 6 - 7 oyda esa murakkab ilovalarni yaratishingiz mumkin. 11 - 12 oy ichida esa o\'zingizning birinchi ilovangizni App Store yoki Play Marketga joylashingiz mumkin bo\'ladi.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Center(
                  child: Text(
                    "QAYSI YO'NALISHGA QIZIQASIZ?",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: getResponsiveSize(context, 17),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ...List.generate(mavzular.length, (index) {
                final isOpen = ochiqIndex == index;
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
                      borderRadius: BorderRadius.circular(10),
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
                          mavzular[index]['title']!,
                          style: GoogleFonts.montserrat(
                            fontSize: getResponsiveSize(context, 15),
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        backgroundColor: Colors.grey.shade200,
                        collapsedBackgroundColor: Colors.grey.shade200,
                        textColor: Colors.black,
                        collapsedTextColor: Colors.black,
                        onExpansionChanged: (bool expanded) {
                          setState(() {
                            ochiqIndex = expanded ? index : null;
                          });
                        },
                        initiallyExpanded: isOpen,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                mavzular[index]['content']!,
                                style: GoogleFonts.afacad(
                                  fontSize: getResponsiveSize(context, 16),
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Center(
                  child: Text(
                    "MASLAXAT KERAKMI? TELEGRAM ORQALI YOZING!",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: getResponsiveSize(context, 17),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Center(
                child: GestureDetector(
                  onTap: () {
                    launchUrl(
                      Uri.parse('https://t.me/islom_nurmukhammadov'),
                      mode: LaunchMode.externalApplication,
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    width: getResponsiveSize(context, 60),
                    height: getResponsiveSize(context, 60),
                    child: Icon(
                      FontAwesomeIcons.telegram,
                      color: Colors.grey.shade800,
                      size: getResponsiveSize(context, 30),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
