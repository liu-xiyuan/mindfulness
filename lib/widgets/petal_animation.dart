import 'dart:developer';
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

    // _scaleAnimation =
    //     Tween<double>(begin: .1, end: 1).animate(_animation); // 创建缩放动画
  }

  @override
  Widget build(BuildContext context) {
    var c = Get.put(PetalAnimationController());

    return AnimatedBuilder(
      animation: c.animation,
      builder: (context, _) {
        return Animate(
          controller: c.controller,
          onPlay: (controller) => controller.repeat(reverse: true),
          child: CustomPaint(
            painter: PetalPainter(progress: c.animation.value),
          ),
        ).scale(
          begin: const Offset(.15, .15),
          end: const Offset(1, 1),
          curve: c.curve,
          duration: c.controller.duration,
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
  }) : petalTweenColors =
            _getPetalTweenColors(petalCount, firstPetalColor, lastPetalColor);

  /// 动画值 value: 0-1
  final double progress;

  final int petalCount;

  final double petalMaxRadius;

  final Color firstPetalColor;

  final Color lastPetalColor;

  final List<Color> petalTweenColors;

  /// 获得花瓣的颜色，使用ColorTween进行插值
  static List<Color> _getPetalTweenColors(int count, Color begin, Color end) {
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

    var angleStep = 2 * pi / petalCount;
    var radius = petalMaxRadius * progress - 2; // -2为了保证动画流畅

    var rotationAngle = 2 * pi / 3 * (1 - progress); // 画布旋转角度

    canvas.save(); // 保存画布状态

    // 将画布旋转
    canvas.translate(size.width / 2, size.height / 2);
    canvas.rotate(rotationAngle);

    for (var i = 0; i < petalCount; i++) {
      double angle = angleStep * i;
      double dx = cos(angle) * radius;
      double dy = sin(angle) * radius;

      paint.color = petalTweenColors[i]; // 花瓣颜色偏移

      // 使用 MaskFilter 添加模糊效果
      paint.maskFilter = MaskFilter.blur(BlurStyle.normal, 2 * (1 - progress));

      canvas.drawCircle(Offset(dx, dy), petalMaxRadius, paint);
    }

    canvas.restore(); // 恢复画布状态
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
