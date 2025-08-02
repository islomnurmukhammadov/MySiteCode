import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islomjonnurmukhammadov/components/size.dart';

class GlassCard extends StatelessWidget {
  final String author;
  final String title;
  final String imagePath;

  const GlassCard({
    super.key,
    required this.author,
    required this.title,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFDEEFFF), // yuqori qismi – pastel light blue
            Color(0xFFC8F1E4), // pastki qismi – pastel greenish
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            author,
            style: GoogleFonts.afacad(
              fontSize: 16,
              color: Colors.black54,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: GoogleFonts.montserrat(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [SizedBox(), Image.asset(imagePath, width: 220)],
          ),
        ],
      ),
    );
  }
}

class GlassCardRow extends StatelessWidget {
  const GlassCardRow({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Container(
      color: const Color(0xFFF1F5FA), // 🧱 Kunduzgi umumiy fon rangi
      child: Column(
        children: [
          SizedBox(height: getResponsiveSize(context, 90)),
          Padding(
            padding: EdgeInsets.only(left: 45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Ustozlarim",
                  style: GoogleFonts.montserrat(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontSize: getResponsiveSize(context, 32),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(),
              ],
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: isMobile
                  ? Column(
                      children: const [
                        GlassCard(
                          author: "Abdurazzoq Abdusalomov",
                          title: "Flutter & Mobile",
                          imagePath: 'assets/icons/flutter.png',
                        ),
                        GlassCard(
                          author: "Bobobek Turdiyev",
                          title: "Frontent & C++",
                          imagePath: 'assets/icons/web.png',
                        ),
                        GlassCard(
                          author: "Dilmurod Yunusov",
                          title: "Office & Python",
                          imagePath: 'assets/icons/python.png',
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Expanded(
                          child: GlassCard(
                            author: "Abdurazzoq Abdusalomov",
                            title: "Flutter & Mobile",
                            imagePath: 'assets/icons/flutter.png',
                          ),
                        ),
                        Expanded(
                          child: GlassCard(
                            author: "Bobobek Turdiyev",
                            title: "Frontent & C++",
                            imagePath: 'assets/icons/web.png',
                          ),
                        ),
                        Expanded(
                          child: GlassCard(
                            author: "Dilmurod Yunusov",
                            title: "Office & Python",
                            imagePath: 'assets/icons/python.png',
                          ),
                        ),
                      ],
                    ),
            ),
          ),

          SizedBox(height: getResponsiveSize(context, 90)),
        ],
      ),
    );
  }
}
