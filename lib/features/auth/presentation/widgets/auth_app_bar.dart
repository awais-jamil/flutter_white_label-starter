import 'package:drive_share/app.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthAppBar extends PreferredSize {
  AuthAppBar({
    super.key,
    required BuildContext context,
    required String title,
    required String headline,
    required String description,
    required bool showBackButton,
  }) : super(
          preferredSize: const Size.fromHeight(140.0),
          child: Stack(
            children: [
              Image.asset(
                AssetImages.scaffold_bg.image,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: context.spacing.l),
                child: AppBar(
                  centerTitle: true,
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  title: Text(
                    title,
                    style: context.headlineMedium!.bold.copyWith(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  leading: showBackButton
                      ? CustomInkWell(
                          onTap: () {
                            context.pop();
                          },
                          borderRadius: context.spacing.xl,
                          color: context.onPrimary,
                          child: const Icon(
                            Icons.arrow_back,
                            size: 24,
                          ),
                        )
                      : null,
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(40.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            headline,
                            style: context.headlineMedium!.bold.copyWith(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: context.spacing.s),
                          Text(
                            description,
                            style: context.bodyLarge!.copyWith(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
}
