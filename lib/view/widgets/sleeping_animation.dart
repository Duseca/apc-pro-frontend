import 'package:flutter/material.dart';
import 'package:apc_pro/consts/app_fonts.dart';

class ZzzAnimation extends StatefulWidget {
  final double size;
  final Color color;

  const ZzzAnimation({super.key, this.size = 15, this.color = Colors.white});

  @override
  State<ZzzAnimation> createState() => _ZzzAnimationState();
}

class _ZzzAnimationState extends State<ZzzAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildZ(String z, double delay, double offsetMultiplier) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        final progress = (_controller.value + delay) % 1.0;
        final offset = Offset(offsetMultiplier * progress * 10, -progress * 20);
        final opacity = 1 - progress;
        return Opacity(
          opacity: opacity.clamp(0.0, 1.0),
          child: Transform.translate(
            offset: offset,
            child: Text(
              z,
              style: TextStyle(
                fontSize: widget.size,
                fontWeight: FontWeight.bold,
                color: widget.color,
                fontFamily: AppFonts.gilroyBold
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.4, // slight tilt for diagonal effect
      child: SizedBox(
        width: widget.size * 4,
        height: widget.size * 4,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
       
            Positioned(top: 10, left: 10, child: _buildZ('Z', 0.33, 1.2)),
            Positioned(top: 20, left: 20, child: _buildZ('Z', 0.66, 1.5)),
                 Positioned(child: _buildZ('Z', 0.0, 1)),
          ],
        ),
      ),
    );
  }
}
