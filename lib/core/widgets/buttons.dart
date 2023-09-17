import 'package:drive_share/core/core.dart';
import 'package:flutter/material.dart';

enum CustomButtonType {
  primary,
  secondary,
  text,
  icon,
}

class CustomButton extends StatelessWidget {
  const CustomButton.primary({
    super.key,
    required this.title,
    this.color,
    this.textStyle,
    this.suffix,
    this.prefix,
    this.onTap,
  })  : type = CustomButtonType.primary,
        icon = null;

  const CustomButton.secondary({
    super.key,
    required this.title,
    this.color,
    this.textStyle,
    this.suffix,
    this.prefix,
    this.onTap,
  })  : type = CustomButtonType.secondary,
        icon = null;

  const CustomButton.text({
    super.key,
    required this.title,
    this.textStyle,
    this.color,
    this.onTap,
  })  : type = CustomButtonType.text,
        suffix = null,
        icon = null,
        prefix = null;

  const CustomButton.icon({
    super.key,
    required this.icon,
    this.color,
    this.onTap,
  })  : type = CustomButtonType.icon,
        suffix = null,
        title = '',
        textStyle = null,
        prefix = null;

  final CustomButtonType type;
  final String title;
  final Color? color;
  final TextStyle? textStyle;
  final Widget? icon;
  final Widget? prefix;
  final Widget? suffix;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return switch (type) {
      CustomButtonType.primary => _CustomPrimaryButton(
          title: title,
          color: color,
          textStyle: textStyle,
          prefix: prefix,
          suffix: suffix,
          onTap: onTap,
        ),
      CustomButtonType.secondary => _CustomSecondaryButton(
          title: title,
          color: color,
          textStyle: textStyle,
          prefix: prefix,
          suffix: suffix,
          onTap: onTap,
        ),
      CustomButtonType.text => _CustomTextButton(
          title: title,
          color: color,
          textStyle: textStyle,
          onTap: onTap,
        ),
      CustomButtonType.icon => _CustomIconButton(
          icon: icon!,
          onTap: onTap,
          color: color,
        ),
    };
  }
}

class _CustomPrimaryButton extends StatelessWidget {
  const _CustomPrimaryButton({
    required this.title,
    this.prefix,
    this.suffix,
    this.color,
    this.textStyle,
    this.onTap,
  });

  final String title;
  final Color? color;
  final TextStyle? textStyle;
  final Widget? prefix;
  final Widget? suffix;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      onTap: onTap,
      color: color ?? context.primary,
      splashColor: Colors.black12.withOpacity(0.1),
      borderRadius: context.spacing.s,
      child: SizedBox(
        height: context.spacing.buttonHeight,
        child: Padding(
          padding: context.spacing.smallHorizontal,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (prefix != null) prefix!,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  title,
                  style: textStyle ??
                      context.bodyLarge?.withColor(context.secondary).copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                ),
              ),
              if (suffix != null) suffix!,
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomSecondaryButton extends StatelessWidget {
  const _CustomSecondaryButton({
    required this.title,
    this.prefix,
    this.suffix,
    this.color,
    this.textStyle,
    this.onTap,
  });

  final String title;
  final Color? color;
  final TextStyle? textStyle;
  final Widget? prefix;
  final Widget? suffix;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      onTap: onTap,
      splashColor: color != null
          ? color?.withOpacity(0.1)
          : context.primary.withOpacity(0.1),
      borderRadius: context.spacing.xs,
      borderColor: color ?? context.primary,
      borderWidth: 1,
      child: SizedBox(
        height: context.spacing.buttonHeight,
        child: Padding(
          padding: context.spacing.smallHorizontal,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (prefix != null) prefix!,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  title,
                  style: textStyle ??
                      context.bodyLarge?.withColor(context.secondary).copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                ),
              ),
              if (suffix != null) suffix!,
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomTextButton extends StatelessWidget {
  const _CustomTextButton({
    required this.title,
    this.color,
    this.textStyle,
    this.onTap,
  });

  final String title;
  final Color? color;
  final TextStyle? textStyle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      onTap: onTap,
      padding: context.spacing.xxSmallHorizontal,
      child: Text(
        title,
        style: textStyle ??
            (color != null
                    ? context.bodyLarge?.withColor(color)
                    : context.bodyLarge?.onSurfaceVariant(context))!
                .copyWith(
              fontSize: 16,
            ),
      ),
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  const _CustomIconButton({
    required this.icon,
    required this.color,
    this.onTap,
  });

  final Widget icon;
  final Color? color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      onTap: onTap,
      borderWidth: 1,
      borderColor: color ?? context.onPrimary,
      color: color ?? context.onPrimary,
      size: const Size(60, 40),
      child: IconTheme(
        data: context.theme.iconTheme.copyWith(size: 20),
        child: icon,
      ),
    );
  }
}
