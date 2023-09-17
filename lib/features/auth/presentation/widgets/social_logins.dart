import 'package:drive_share/app.dart';
import 'package:flutter/material.dart';

class SocialLogins extends StatelessWidget {
  const SocialLogins({
    super.key,
    this.onGoogleTap,
    this.onAppleTap,
  });

  final VoidCallback? onGoogleTap;
  final VoidCallback? onAppleTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomButton.icon(
          icon: Padding(
            padding: context.spacing.smallAll,
            child: Image.asset(
              AssetImages.google_icon.image,
            ),
          ),
          onTap: () {},
        ),
        SizedBox(width: context.spacing.m),
        CustomButton.icon(
          icon: Icon(
            Icons.apple,
            color: Colors.black,
            size: context.spacing.xl,
          ),
          onTap: () {},
        ),
      ],
    );
  }
}
