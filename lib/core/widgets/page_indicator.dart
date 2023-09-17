import 'package:drive_share/core/core.dart';
import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    Key? key,
    required this.currentPage,
    required this.pageCount,
  }) : super(key: key);

  final int currentPage;
  final int pageCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 0; i < pageCount; i++)
          Container(
            width: i == currentPage ? 20 : 8,
            height: 8,
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: i == currentPage
                  ? context.secondary
                  : context.secondary.withOpacity(0.2),
              borderRadius: BorderRadius.circular(context.spacing.xxs),
            ),
          ),
      ],
    );
  }
}
