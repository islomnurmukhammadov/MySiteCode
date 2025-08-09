import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialIcons extends StatelessWidget {
  const SocialIcons({super.key});

  Future<void> _launch(String webUrl, String appUrl) async {
    final Uri uri = Uri.parse(kIsWeb ? webUrl : appUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    final double boxSize = isMobile ? 80 : 130;
    final double iconSize = isMobile ? 28 : 40;
    final double fontSize = isMobile ? 15 : 18;

    final List<Map<String, dynamic>> socialLinks = [
      {
        'icon': FontAwesomeIcons.envelope,
        'label': 'Email',
        'web': 'mailto:nurmukhammadovdeveloper@gmail.com',
        'app': 'mailto:nurmukhammadovdeveloper@gmail.com',
      },
      {
        'icon': FontAwesomeIcons.telegram,
        'label': 'Telegram',
        'web': 'https://t.me/islom_nurmukhammadov',
        'app': 'tg://resolve?domain=islom_nurmukhammadov',
      },
      {
        'icon': FontAwesomeIcons.youtube,
        'label': 'YouTube',
        'web': 'https://youtube.com/@islom_nurmukhammadov',
        'app': 'youtube://www.youtube.com/@islom_nurmukhammadov',
      },
      {
        'icon': FontAwesomeIcons.github,
        'label': 'GitHub',
        'web': 'https://github.com/islomnurmukhammadov',
        'app': 'https://github.com/islomnurmukhammadov',
      },
    ];

    return Wrap(
      alignment: WrapAlignment.center,
      spacing: isMobile ? 10 : 20,
      runSpacing: isMobile ? 10 : 20,
      children: socialLinks.map((item) {
        return Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () => _launch(item['web'], item['app']),
            child: Container(
              width: boxSize,
              height: boxSize,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white.withOpacity(0.05),
                border: Border.all(color: Colors.white.withOpacity(0.1)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.04),
                    Colors.white.withOpacity(0.01),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(
                    item['icon'],
                    size: iconSize,
                    color: Colors.white.withOpacity(0.85),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item['label'],
                    style: GoogleFonts.afacad(
                      fontSize: fontSize,

                      color: Colors.white70,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
