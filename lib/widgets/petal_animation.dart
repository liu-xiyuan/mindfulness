import 'dart:math' hide log;
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:mindfulness/controller/petal_animation_controller.dart';

/// 花瓣呼吸动画
class PetalAnimation extends StatefulWidget {
  const PetalAnimation({super.key});

  @override
  State<PetalAnimation> createState() => _PetalAnimationState();
}

class _PetalAnimationState extends State<PetalAnimation>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var c = Get.put(PetalAnimationController());

    return AnimatedBuilder(
      animation: c.animation,
      builder: (context, _) {
        return SizedBox(
          width: 400,
          height: 400,
          child: ScaleTransition(
            scale: c.scaleTween,
            child: CustomPaint(
              painter: PetalPainter(progress: c.animation.value),
            ),
          ),
        );
      },
    );
  }
}

class PetalPainter extends CustomPainter {
  PetalPainter({
    required this.progress,
    this.petalCount = 8,
    this.petalMaxRadius = 100,
    this.firstPetalColor = const Color.fromRGBO(44, 151, 153, 1),
    this.lastPetalColor = const Color.fromRGBO(79, 217, 158, 1),
  })  : petalTweenColors =
            _getTweenColors(petalCount, firstPetalColor, lastPetalColor),
        reverseProgress = 1 - progress,
        angleStep = 2 * pi / petalCount;

  /// 动画值 value: 0-1
  final double progress;

  final double reverseProgress;

  final int petalCount;

  final double petalMaxRadius;

  final Color firstPetalColor;

  final Color lastPetalColor;

  final List<Color> petalTweenColors;

  final double angleStep;

  /// 获得花瓣的颜色，使用ColorTween进行插值
  static List<Color> _getTweenColors(int count, Color begin, Color end) {
    List<Color> result = [];

    for (var i = 0; i < count; i++) {
      Color color = ColorTween(begin: begin, end: end).lerp(i / count)!;
      result.add(color);
    }

    return result;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..blendMode = BlendMode.screen
      ..isAntiAlias = true;

    // var petalRadius = lerpDouble(petalMinRadius, petalMaxRadius, progress)!;

    var radius = petalMaxRadius * progress - 2; // -2为了保证动画流畅

    var rotateAngle = 2 * pi / 3 * reverseProgress; // 画布旋转角度

    canvas.save();

    // 将画布旋转
    canvas.translate(size.width / 2, size.height / 2);
    canvas.rotate(rotateAngle);

    for (var i = 0; i < petalCount; i++) {
      double angle = (i + .5) * angleStep - pi / 2;
      double dx = cos(angle) * radius;
      double dy = sin(angle) * radius;

      paint.color = petalTweenColors[i]; // 花瓣颜色偏移

      paint.maskFilter = MaskFilter.blur(BlurStyle.normal, 3 * reverseProgress);

      canvas.drawCircle(Offset(dx, dy), petalMaxRadius, paint);
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
