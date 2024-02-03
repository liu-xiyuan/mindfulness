import 'package:flutter/animation.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:mindfulness/common/extensions/string_extensions.dart';

class PetalAnimationController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  var duration = 4000.ms.obs;

  var curve = Curves.ease;

  var tips = '呼气'.obs;

  @override
  void onInit() {
    super.onInit();
    controller = AnimationController(vsync: this, duration: duration.value)
      ..repeat(reverse: true);
    animation = CurvedAnimation(
      parent: controller,
      curve: curve,
      reverseCurve: curve,
    );
    initListener();
  }

  void initListener() {
    controller.addStatusListener((status) {
      switch (status) {
        case AnimationStatus.completed:
          // log('completed');
          break;
        case AnimationStatus.forward:
          // log('forward');
          tips.value = '吸气';
          break;
        case AnimationStatus.reverse:
          // log('reverse');
          tips.value = '呼气';
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
