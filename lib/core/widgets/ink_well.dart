import 'package:drive_share/core/core.dart';
import 'package:flutter/material.dart';

class CustomInkWell extends StatelessWidget {
  const CustomInkWell({
    super.key,
    required this.child,
    this.color,
    this.splashColor,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.size,
    this.padding = EdgeInsets.zero,
    this.onTap,
  });

  final Widget child;
  final Color? color;
  final Color? splashColor;
  final Color? borderColor;
  final double? borderWidth;
  final double? borderRadius;
  final Size? size;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color ?? Colors.transparent,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        side: borderWidth != null
            ? BorderSide(
                color: borderColor ?? context.outline,
                width: borderWidth!,
              )
            : BorderSide.none,
        borderRadius: BorderRadius.all(
            Radius.circular(borderRadius ?? context.spacing.s)),
      ),
      child: onTap == null
          ? _child
          : InkWell(
              onTap: onTap,
              splashColor: splashColor,
              highlightColor: splashColor?.withOpacity(0.1),
              child: _child,
            ),
    );
  }

  Widget get _child => SizedBox.fromSize(
        size: size,
        child: Padding(
          padding: padding,
          child: child,
        ),
      );
}
