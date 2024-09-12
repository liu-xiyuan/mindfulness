import 'package:flutter_animate/flutter_animate.dart';

/// 每分钟呼吸次数
enum BreathsPer {
  four,
  five,
  six,
  seven,
  eight,
  nine,
  ten,
}

extension BreathsPerDuration on BreathsPer {
  Duration get duration {
    return switch (this) {
      BreathsPer.four => 14500.ms,
      BreathsPer.five => 11500.ms,
      BreathsPer.six => 9500.ms,
      BreathsPer.seven => 8071.ms,
      BreathsPer.eight => 5000.ms,
      BreathsPer.nine => 6160.ms,
      BreathsPer.ten => 5500.ms,
    };
  }
}
