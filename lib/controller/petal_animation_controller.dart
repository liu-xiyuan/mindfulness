import 'dart:developer';

import 'package:flutter/animation.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class PetalAnimationController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  late Animation<double> scaleTween;

  var duration = 6000.ms.obs;

  var curve = Curves.easeInOutCubic;

  var tips = '呼气'.obs;

  @override
  void onInit() {
    super.onInit();
    controller = AnimationController(vsync: this, duration: duration.value);
    animation = CurvedAnimation(
      parent: controller,
      curve: curve,
      reverseCurve: curve,
    );

    scaleTween = Tween<double>(begin: .15, end: 1).animate(animation); // 创建缩放动画

    controller.forward();

    initListener();
  }

  void initListener() {
    animation.addStatusListener((status) {
      switch (status) {
        case AnimationStatus.forward:
          {
            log('forward');
          }
          break;
        case AnimationStatus.completed:
          {
            controller.reverse();
            log('completed');
          }
          break;
        case AnimationStatus.reverse:
          {
            log('reverse');
          }
          break;
        case AnimationStatus.dismissed:
          {
            controller.forward();
          }
          break;
        default:
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
    controller.dispose();
  }
}
