import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';
import 'package:mindfulness/controller/petal_animation_controller.dart';

/// 调试面板
class DebugPanel extends StatelessWidget {
  const DebugPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Acrylic(
      tint: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Mode: ',
                style: TextStyle(color: Colors.white),
              ).marginOnly(right: 8),
              FilledButton(
                onPressed: () =>
                    PetalAnimationController.to.playStandbyAnimation(),
                child: const Text('standby'),
              ).marginOnly(right: 8),
              FilledButton(
                onPressed: () =>
                    PetalAnimationController.to.playPrepareAnimation(),
                child: const Text('prepare'),
              ).marginOnly(right: 8),
              FilledButton(
                onPressed: () =>
                    PetalAnimationController.to.playBreathAnimation(),
                child: const Text('breath'),
              ),
            ],
          ).marginOnly(bottom: 8),
          Row(
            children: [
              const Text(
                'Control: ',
                style: TextStyle(color: Colors.white),
              ).marginOnly(right: 8),
              FilledButton(
                onPressed: () => PetalAnimationController.to.controller
                    .repeat(reverse: true),
                child: const Text('paly'),
              ).marginOnly(right: 8),
              FilledButton(
                onPressed: () => PetalAnimationController.to.controller.stop(),
                child: const Text('stop'),
              ).marginOnly(right: 8),
            ],
          ).marginOnly(bottom: 8),
          // Row(
          //   children: [
          //     const Text(
          //       'Windows: ',
          //       style: TextStyle(color: Colors.white),
          //     ).marginOnly(right: 8),
          //     FilledButton(
          //       onPressed: () => appWindow.maximizeOrRestore(),
          //       child: const Text('full screen'),
          //     ).marginOnly(right: 8),
          //   ],
          // ),
        ],
      ),
    );
  }
}
