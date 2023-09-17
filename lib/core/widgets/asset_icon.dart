import 'package:drive_share/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AssetIcon extends StatelessWidget {
  const AssetIcon(
    this.icon, {
    this.size,
    this.color,
    super.key,
  });

  final AssetIcons icon;
  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final iconTheme = IconTheme.of(context);
    return SvgPicture.asset(
      icon.svg,
      width: size ?? iconTheme.size,
      height: size ?? iconTheme.size,
      colorFilter: ColorFilter.mode(
        color ?? iconTheme.color ?? context.primary,
        BlendMode.srcIn,
      ),
    );
  }
}
