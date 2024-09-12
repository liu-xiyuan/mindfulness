import 'dart:developer';

import 'package:flutter/animation.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:mindfulness/enums/breaths_per.dart';

// enum PetalAnimationMode {
//   prepare,
//   breath,
//   loop,
//   standby,
// }

class PetalAnimationController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static PetalAnimationController get to => Get.find();

  late AnimationController controller;
  late Animation<double> animation;

  late Animation<double> scaleTween;

  var breathsPer = BreathsPer.ten;

  var tips = '呼气'.obs;

  @override
  void onInit() {
    super.onInit();
    initAnimation();
  }

  void initAnimation() {
    controller =
        AnimationController(vsync: this, duration: breathsPer.duration);
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.ease,
    );
    scaleTween = Tween<double>(begin: .15, end: 1).animate(animation);

    playStandbyAnimation();
  }

  /// 播放待机动画
  void playStandbyAnimation() {
    controller.animateBack(0, duration: 2000.ms).whenComplete(() {
      controller.duration = 8000.ms;
      animation = CurvedAnimation(
        parent: controller,
        curve: Curves.fastOutSlowIn,
        reverseCurve: Curves.fastOutSlowIn.flipped,
      );
      scaleTween = Tween<double>(begin: .15, end: .6).animate(animation);

      controller.repeat(reverse: true);
    });
  }

  /// 播放准备动画
  void playPrepareAnimation() {
    controller.animateBack(0, duration: 2000.ms).whenComplete(() {
      controller.duration = 3000.ms;
      animation = CurvedAnimation(
        parent: controller,
        // curve: Curves.fastEaseInToSlowEaseOut,
        curve: Curves.fastOutSlowIn,
        reverseCurve: Curves.fastOutSlowIn.flipped,
      )..addStatusListener((status) {
          if (status == AnimationStatus.completed) playBreathAnimation();
        });
      scaleTween = Tween<double>(begin: .15, end: .6).animate(animation);

      controller.loop(count: 4, reverse: true);
    });
  }

  /// 播放呼吸动画
  void playBreathAnimation() {
    controller.animateBack(0, duration: 2000.ms).whenComplete(() {
      controller.duration = 4500.ms; // 7 time
      // controller.duration = _getDuration();

      Curve curve = const Cubic(.4, 0, .5, 1);
      animation = CurvedAnimation(
        parent: controller,
        curve: curve,
        reverseCurve: curve.flipped,
      );

      scaleTween = Tween<double>(begin: .15, end: 1).animate(animation);

      controller.repeat(reverse: true);
    });
  }

  @override
  void onClose() {
    super.onClose();
    controller.dispose();
  }
}
