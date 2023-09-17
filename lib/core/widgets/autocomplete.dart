// ignore_for_file: unnecessary_null_comparison

import 'dart:async';
import 'dart:math';

import 'package:drive_share/core/core.dart';
import 'package:flutter/material.dart';

const kAutocompleteMinOptionHeight = 54.0;
const kAutocompleteVisibleOptionCount = 5;
const kAutocompleteOptionsOffset = Offset(0.0, 12.0);

typedef AutocompleteOptionViewBuilder<T extends Object> = Widget Function(
  BuildContext context,
  AutocompleteOnSelected<T> onSelected,
  int index,
  T option,
);

typedef AutocompleteOptionFilter<T extends Object> = bool Function(
  TextEditingValue textEditingValue,
  T option,
);

typedef AutocompleteOptions<T extends Object> = FutureOr<Iterable<T>>
    Function();

class SmartAutocomplete<T extends Object> extends StatelessWidget {
  const SmartAutocomplete({
    super.key,
    required this.options,
    this.onSelected,
    this.fieldViewBuilder,
    required this.optionViewBuilder,
    this.optionFilter = SmartAutocomplete.defaultFilter,
    this.divider,
    this.optionHeight = kAutocompleteMinOptionHeight,
    this.visibleOptionCount = kAutocompleteVisibleOptionCount,
    this.margin,
    this.focusNode,
    this.controller,
    this.initialValue,
    this.onFieldChanged,
  });

  final AutocompleteOptions<T> options;
  final AutocompleteOnSelected<T>? onSelected;
  final AutocompleteFieldViewBuilder? fieldViewBuilder;
  final AutocompleteOptionViewBuilder<T> optionViewBuilder;
  final AutocompleteOptionFilter<T>? optionFilter;
  final Widget? divider;
  final double optionHeight;
  final int visibleOptionCount;
  final EdgeInsetsGeometry? margin;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final TextEditingValue? initialValue;
  final ValueChanged<String>? onFieldChanged;

  static bool defaultFilter(TextEditingValue textEditingValue, Object option) {
    return option
        .toString()
        .toLowerCase()
        .contains(textEditingValue.text.toLowerCase());
  }

  @override
  Widget build(BuildContext context) {
    return RawAutocomplete<T>(
      onSelected: onSelected,
      optionsBuilder: (textEditingValue) async {
        final options = await this.options();
        return textEditingValue.text.isEmpty
            ? []
            : optionFilter == null
                ? options
                : options
                    .where((option) => optionFilter!(textEditingValue, option));
      },
      fieldViewBuilder: fieldViewBuilder,
      optionsViewBuilder: _buildOptionsView,
      focusNode: focusNode,
      textEditingController: controller,
      initialValue: initialValue,
      // onFieldChanged: onFieldChanged,
    );
  }

  Widget _buildOptionsView(
    BuildContext context,
    AutocompleteOnSelected<T> onSelected,
    Iterable<T> options,
  ) {
    return Container(
      margin: margin,
      alignment: AlignmentDirectional.topStart,
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          if (options.isNotEmpty)
            Material(
              elevation: 10,
              shadowColor: context.shadow,
              child: Container(
                constraints: BoxConstraints.expand(height: optionHeight / 2),
              ),
            ),
          Material(
            child: SizedBox(
              height: min(
                optionHeight * visibleOptionCount,
                optionHeight * options.length,
              ),
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemCount: options.length,
                separatorBuilder: (context, index) =>
                    divider ?? const Divider(),
                itemBuilder: (context, index) {
                  final option = options.elementAt(index);
                  return optionViewBuilder(
                    context,
                    onSelected,
                    index,
                    option,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
