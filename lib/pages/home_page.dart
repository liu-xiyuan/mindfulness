import 'dart:async';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';
import 'package:mindfulness/controller/petal_animation_controller.dart';
import 'package:mindfulness/services/xbox_input_service.dart';
import 'package:mindfulness/widgets/petal_animation.dart';

class HomePage extends GetView<PetalAnimationController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      content: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PetalAnimation(),
          ],
        ),
      ),
    );
  }
}
