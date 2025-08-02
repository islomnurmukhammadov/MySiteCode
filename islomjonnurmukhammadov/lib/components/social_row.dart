import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaRow extends StatelessWidget {
  const SocialMediaRow({super.key});

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'nurmukhammadovdeveloper@gmail.com',
    );
    if (!await launchUrl(
      emailLaunchUri,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch email';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.youtube),
            onPressed: () =>
                _launchUrl('https://youtube.com/@islom_nurmukhammadov'),
          ),
          SizedBox(width: 10),
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.instagram),
            onPressed: () =>
                _launchUrl('https://instagram.com/islom_nurmukhammadov'),
          ),
          SizedBox(width: 10),
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.github),
            onPressed: () =>
                _launchUrl('https://github.com/islomnurmukhammadov'),
          ),
          SizedBox(width: 10),
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.telegram),
            onPressed: () => _launchUrl('https://t.me/islom_nurmukhammadov'),
          ),
          SizedBox(width: 10),
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.envelope),
            onPressed: _launchEmail,
          ),
        ],
      ),
    );
  }
}
