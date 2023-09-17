import 'package:drive_share/core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:locale/locale.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _index = 0;

  PageController controller = PageController();

  void _moveAhead(BuildContext context) {
    if (_index < 2) {
      setState(() {
        _index++;
      });
      controller.animateToPage(
        _index,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeIn,
      );
    } else {
      context.pushReplacement(AppRouterPage.login.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.primary,
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            if (_index != 2)
              Padding(
                padding: EdgeInsets.only(
                    top: context.spacing.xxl, right: context.spacing.l),
                child: Row(
                  children: [
                    const Spacer(),
                    CustomButton.text(
                      title: LocaleStrings.skip(),
                      color: context.secondary,
                      textStyle: context.headlineMedium!.bold,
                    ),
                  ],
                ),
              ),
            Column(
              children: [
                Expanded(
                  child: PageView(
                    allowImplicitScrolling: true,
                    scrollDirection: Axis.horizontal,
                    controller: controller,
                    onPageChanged: (newIndex) {
                      setState(() {
                        _index = newIndex;
                      });
                    },
                    children: [
                      _ObPage(
                        index: _index,
                        imageAsset: AssetImages.ob1.image,
                        title: LocaleStrings.ob1title(),
                        subtitle: LocaleStrings.ob1subtitle(),
                      ),
                      _ObPage(
                        index: _index,
                        imageAsset: AssetImages.ob2.image,
                        title: LocaleStrings.ob2title(),
                        subtitle: LocaleStrings.ob2subtitle(),
                      ),
                      _ObPage(
                        index: _index,
                        imageAsset: AssetImages.ob3.image,
                        title: LocaleStrings.ob3title(),
                        subtitle: LocaleStrings.ob3subtitle(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 100,
              right: 0,
              left: 0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  PageIndicator(
                    currentPage: _index,
                    pageCount: 3,
                  )
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _moveAhead(context),
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}

class _ObPage extends StatelessWidget {
  const _ObPage({
    required this.index,
    required this.imageAsset,
    required this.title,
    required this.subtitle,
  });

  final int index;
  final String imageAsset;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Opacity(
              opacity: 0,
              child: Image.asset(
                AssetImages.ob3.image,
              ),
            ),
            if (index != 2)
              Positioned(
                left: 0,
                right: 0,
                bottom: 20,
                child: Image.asset(
                  imageAsset,
                ),
              )
            else
              Image.asset(
                AssetImages.ob3.image,
              )
          ],
        ),
        SizedBox(height: context.spacing.xl),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.spacing.xxl),
          child: Column(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: context.headlineMedium!.bold.copyWith(
                  color: context.secondary,
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: context.spacing.l),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: context.bodyLarge!.copyWith(
                  color: context.secondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: context.spacing.l),
            ],
          ),
        ),
      ],
    );
  }
}
