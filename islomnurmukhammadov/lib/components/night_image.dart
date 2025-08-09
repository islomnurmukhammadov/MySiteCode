// ignore_for_file: non_constant_identifier_names

import 'dart:ui';
import 'package:flutter/material.dart';

class CreativeNightImage extends StatefulWidget {
  // ignore: duplicate_ignore
  // ignore: non_constant_identifier_names
  const CreativeNightImage({super.key, required this.image_asset, required this.width_size});

  final String image_asset;
  final double width_size;
  @override
  State<CreativeNightImage> createState() => _CreativeNightImageState();
}

class _CreativeNightImageState extends State<CreativeNightImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scale;
  late Animation<double> _rotate;
  late Animation<double> _fade;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    );

    _scale = Tween<double>(
      begin: 0.6,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    _rotate = Tween<double>(
      begin: -0.2,
      end: 0.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _fade = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _fade.value,
          child: Transform.rotate(
            angle: _rotate.value,
            child: Transform.scale(
              scale: _scale.value,
              child: Container(
                width: widget.width_size,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.4),
                      Colors.blueGrey.withOpacity(0.2),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.cyanAccent.withOpacity(0.6),
                      blurRadius: 25,
                      spreadRadius: 4,
                      offset: const Offset(0, 12),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(widget.image_asset, fit: BoxFit.cover),
                      BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                        child: Container(color: Colors.black.withOpacity(0.15)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
