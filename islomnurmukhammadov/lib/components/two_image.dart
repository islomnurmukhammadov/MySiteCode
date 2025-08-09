import 'package:flutter/material.dart';
import 'package:islomnurmukhammadov/components/is_mobile.dart';

class TwoImageWidget extends StatefulWidget {
  const TwoImageWidget({super.key});

  @override
  State<TwoImageWidget> createState() => _TwoImageWidgetState();
}

class _TwoImageWidgetState extends State<TwoImageWidget> {
  String image_1 = "assets/images/my_1.png";
  String image_2 = "assets/images/my_2.jpg";
  void changeImage() {
    if (image_1 == "assets/images/my_1.png") {
      setState(() {
        image_1 = "assets/images/my_2.jpg";
        image_2 = "assets/images/my_1.png";
      });
    } else {
      setState(() {
        image_1 = "assets/images/my_1.png";
        image_2 = "assets/images/my_2.jpg";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double imageSize = isTablet(context)
        ? 140
        : isMobile(context)
        ? 120
        : 220;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(),
        Padding(
          padding: EdgeInsets.only(
            right: MediaQuery.of(context).size.width * 0.15,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Orqa soyali rasm (image_2)
              Transform.rotate(
                angle: 0.25,
                child: Container(
                  width: imageSize,
                  height: imageSize,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: AssetImage(image_2),
                      fit: BoxFit.cover,
                    ),
                  ),
                  foregroundDecoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),

              // Old rasm (image_1) - AnimatedSwitcher orqali
              GestureDetector(
                onTap: changeImage,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  switchInCurve: Curves.easeOutBack,
                  switchOutCurve: Curves.easeInBack,
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                        return RotationTransition(
                          turns: animation,
                          child: FadeTransition(
                            opacity: animation,
                            child: child,
                          ),
                        );
                      },
                  child: Transform.rotate(
                    key: ValueKey(image_1),
                    angle: 0.1,
                    child: Container(
                      width: imageSize,
                      height: imageSize,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                        image: DecorationImage(
                          image: AssetImage(image_1),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
