import 'package:flutter/cupertino.dart';

/// 将十六进制格式的颜色字符串转换成Color
extension StringColorExtensions on String {
  Color toColor() {
    final buffer = StringBuffer();
    if (length == 6 || length == 7) buffer.write('ff');
    buffer.write(replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
