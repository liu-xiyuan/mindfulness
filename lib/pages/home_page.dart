import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';
import 'package:mindfulness/controller/petal_animation_controller.dart';
import 'package:mindfulness/widgets/petal_animation.dart';

class HomePage extends GetView<PetalAnimationController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      padding: const EdgeInsets.all(0),
      header: SizedBox(
        width: double.infinity,
        height: 30,
        child: MoveWindow(),
      ),
      content: const SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PetalAnimation(),
          ],
        ),
      ),
    );
  }
}
