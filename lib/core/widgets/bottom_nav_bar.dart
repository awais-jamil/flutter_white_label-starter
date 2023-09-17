import 'package:drive_share/core/core.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: context.spacing.xxl,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: children,
          ),
        ),
      ),
    );
  }
}

class CustomBottomNavItem extends StatelessWidget {
  const CustomBottomNavItem({
    super.key,
    required this.icon,
    required this.label,
    this.selectedColor,
    this.unselectedColor,
    this.backgroundColor,
    this.textStyle,
    this.isSelected = false,
    this.onTap,
  });

  final Widget icon;
  final String label;
  final Color? selectedColor;
  final Color? unselectedColor;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final selectedColor = this.selectedColor ?? context.primary;
    final unselectedColor = this.unselectedColor ?? context.primary;
    final color = isSelected ? selectedColor : unselectedColor;
    final backgroundColor = isSelected
        ? this.backgroundColor ?? context.background
        : Colors.transparent;
    final textStyle = (this.textStyle ?? context.bodySmall)?.withColor(color);
    return CustomInkWell(
      color: backgroundColor,
      onTap: onTap,
      padding: EdgeInsets.symmetric(
        vertical: context.spacing.xs,
        horizontal: context.spacing.m,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconTheme(
            data: IconThemeData(
              color: color,
            ),
            child: icon,
          ),
          Visibility(
            visible: isSelected,
            child: Padding(
              padding: EdgeInsetsDirectional.only(start: context.spacing.xs),
              child: Text(
                label,
                style: textStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
