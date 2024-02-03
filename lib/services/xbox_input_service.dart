import 'dart:async';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:win32_gamepad/win32_gamepad.dart';

class XboxInputService extends GetxController {
  static XboxInputService get to => Get.find();
  final gamepad = Gamepad(0);
  Timer? _vibrationTimer;
  Timer? _pollingTimer;

  Future<XboxInputService> init() async {
    initGamepadListener();
    return this;
  }

  void initGamepadListener() {
    _pollingTimer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      gamepad.updateState();

      if (gamepad.state.buttonA) {
        vibrate(7);
      }
    });
  }

  void vibrate(int speed) {
    if (gamepad.isConnected) {
      var result = speed.clamp(0, 65535);
      gamepad.vibrate(leftMotorSpeed: result, rightMotorSpeed: result);
    }
  }

// 根据曲线变化调整震动间隔
  Future<void> curveVibration({
    required Duration totalDuration,
  }) async {
    /// 曲线
    Curve curve = Curves.easeInCirc;
    // Curve curve = Curves.easeInCubic;

    /// 震动强度
    int vibrateSpeed = 20000;

    /// 单位震动持续时间
    Duration vibrateDuration = const Duration(milliseconds: 100);

    int steps = 8; // 震动模式中的步数

    /// 曲线持续时间
    Duration curveDuration = totalDuration - vibrateDuration * steps;

    /// 总持续时间
    // Duration totalDuration = curveDuration + vibrateDuration * steps;

    for (int i = 0; i < steps; i++) {
      double progress = i / steps; // 计算当前进度

      double curveValue = curve.transform(progress);
      int waitTime =
          (curveDuration.inMilliseconds * curveValue).toInt(); // 根据曲线计算震动间隔

      vibrate(vibrateSpeed); // 执行震动
      await Future.delayed(vibrateDuration); // 震动持续时间
      vibrate(0);

      if (i < steps - 1) {
        await Future.delayed(Duration(milliseconds: waitTime)); // 等待下一个震动点
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _pollingTimer?.cancel();
    _vibrationTimer?.cancel();
  }
}
