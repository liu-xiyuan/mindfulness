import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';
import 'package:mindfulness/controller/petal_animation_controller.dart';
import 'package:mindfulness/widgets/debug_panel.dart';
import 'package:mindfulness/widgets/petal_animation.dart';

class HomePage extends GetView<PetalAnimationController> {
  const HomePage({super.key}) : windowBarHeight = 30;

  final double windowBarHeight;

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      padding: const EdgeInsets.all(0),
      header: SizedBox(
        width: double.infinity,
        height: windowBarHeight,
        child: MoveWindow(),
      ),
      content: const SizedBox.expand(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(top: 0, right: 0, child: DebugPanel()),
            PetalAnimation(),
          ],
        ),
      ).paddingOnly(
          bottom: windowBarHeight,
          left: windowBarHeight,
          right: windowBarHeight),
    );
  }
}
