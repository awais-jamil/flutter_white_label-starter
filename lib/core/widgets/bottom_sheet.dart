import 'package:drive_share/core/core.dart';
import 'package:flutter/material.dart';

class CustomBottomSheet extends BottomSheet {
  CustomBottomSheet({
    Key? key,
    required Widget child,
    required BuildContext context,
    required bool showCloseButton,
    double? height,
  }) : super(
          key: key,
          onClosing: () {},
          enableDrag: false,
          builder: (BuildContext context) {
            return Material(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(context.spacing.l),
                topRight: Radius.circular(context.spacing.l),
              ),
              color: Colors.white,
              borderOnForeground: false,
              elevation: 10,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      if (showCloseButton)
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.close,
                            color: Colors.transparent,
                          ),
                        ),
                      const Spacer(),
                      Container(
                        height: 4,
                        width: 40,
                        decoration: BoxDecoration(
                          color: context.secondary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const Spacer(),
                      if (showCloseButton)
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.close),
                        ),
                    ],
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight:
                          height ?? MediaQuery.of(context).size.height / 2,
                    ),
                    child: SingleChildScrollView(child: child),
                  ),
                ],
              ),
            );
          },
        );

  static void show({
    required BuildContext context,
    required Widget child,
    double? height,
    bool showCloseButton = true,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: false,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      enableDrag: false,
      elevation: 10,
      builder: (context) {
        return CustomBottomSheet(
          context: context,
          height: height,
          showCloseButton: showCloseButton,
          child: child,
        );
      },
    );
  }
}

class CustomDraggableBottomSheet extends DraggableScrollableSheet {
  CustomDraggableBottomSheet({
    Key? key,
    required Widget child,
    required BuildContext context,
    required bool showCloseButton,
    double? height,
  }) : super(
          key: key,
          expand: true,
          initialChildSize: 0.5,
          minChildSize: 0.25,
          maxChildSize: 0.9,
          builder: (BuildContext context, ScrollController scrollController) {
            return Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(context.spacing.l),
                  topRight: Radius.circular(context.spacing.l),
                ),
              ),
              color: Colors.white,
              borderOnForeground: false,
              elevation: 10,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: context.spacing.xs),
                  Row(
                    children: [
                      if (showCloseButton)
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.close,
                            color: Colors.transparent,
                          ),
                        ),
                      const Spacer(),
                      Container(
                        height: 4,
                        width: 40,
                        decoration: BoxDecoration(
                          color: context.secondary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const Spacer(),
                      if (showCloseButton)
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.close),
                        ),
                    ],
                  ),
                  Expanded(
                    child: ListView(
                      controller: scrollController,
                      children: [child],
                    ),
                  ),
                ],
              ),
            );
          },
        );
}
