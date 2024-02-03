import 'package:flutter/material.dart';

/// 添加鼠标的悬停样式
extension MouseCursors on Widget {
  Widget withMouseCursor({
    MouseCursor cursor = SystemMouseCursors.click,
    String? tip,
  }) =>
      TooltipVisibility(
        // visible: tip == null ? false : true,
        visible: false,
        child: Tooltip(
          message: tip ?? 'null',
          child: MouseRegion(
            cursor: cursor,
            child: this,
          ),
        ),
      );
}
