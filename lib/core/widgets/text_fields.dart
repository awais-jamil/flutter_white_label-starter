import 'package:drive_share/core/core.dart';
import 'package:flutter/material.dart';

enum CustomTextFieldType {
  textField,
  dropdown,
  textArea,
}

class CustomTextField extends StatelessWidget {
  const CustomTextField.textField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    required this.keyboardType,
    required this.validator,
    this.textStyle,
    this.isPasswordField = false,
    this.suffix,
  })  : type = CustomTextFieldType.textField,
        items = const [];

  const CustomTextField.textArea({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    required this.validator,
    this.textStyle,
  })  : type = CustomTextFieldType.textArea,
        suffix = null,
        keyboardType = null,
        items = const [],
        isPasswordField = false;

  const CustomTextField.dropdown({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    required this.validator,
    required this.items,
    this.textStyle,
    this.suffix,
  })  : type = CustomTextFieldType.dropdown,
        keyboardType = null,
        isPasswordField = false;

  final CustomTextFieldType type;
  final String label;
  final String hint;
  final FormFieldValidator? validator;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final TextStyle? textStyle;
  final Widget? suffix;
  final bool isPasswordField;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return switch (type) {
      CustomTextFieldType.textField => _CustomTextField(
          label: label,
          hint: hint,
          controller: controller,
          textStyle: textStyle,
          validator: validator,
          keyboardType: keyboardType,
          suffix: suffix,
          isPasswordField: isPasswordField,
        ),
      CustomTextFieldType.textArea => _CustomTextArea(
          label: label,
          hint: hint,
          validator: validator,
          controller: controller,
          textStyle: textStyle,
        ),
      CustomTextFieldType.dropdown => _CustomDropDown(
          label: label,
          hint: hint,
          validator: validator,
          controller: controller,
          textStyle: textStyle,
          items: items,
        ),
    };
  }
}

class _CustomDropDown extends StatefulWidget {
  const _CustomDropDown({
    Key? key,
    required this.label,
    required this.hint,
    required this.controller,
    required this.validator,
    required this.items,
    this.textStyle,
  }) : super(key: key);

  final List<String> items;
  final String label;
  final String hint;
  final TextEditingController? controller;
  final FormFieldValidator? validator;
  final TextStyle? textStyle;

  @override
  State<_CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<_CustomDropDown> {
  bool _expand = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: widget.textStyle ??
              context.bodyLarge?.withColor(context.secondary).semiBold.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
        ),
        SizedBox(height: context.spacing.xs),
        CustomInkWell(
          borderRadius: 0,
          onTap: () {
            setState(() {
              _expand = !_expand;
            });
          },
          child: TextFormField(
            onChanged: (value) {},
            validator: widget.validator,
            controller: widget.controller,
            maxLines: 1,
            enabled: false,
            decoration: InputDecoration(
              hintText: widget.hint,
              filled: true,
              fillColor: context.onPrimary,
              contentPadding: context.spacing.xSmallHV,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(context.spacing.xs),
                  topRight: Radius.circular(context.spacing.xs),
                  bottomLeft: _expand
                      ? Radius.zero
                      : Radius.circular(context.spacing.xs),
                  bottomRight: _expand
                      ? Radius.zero
                      : Radius.circular(context.spacing.xs),
                ),
                borderSide: BorderSide.none,
              ),
              hintStyle: context.bodyLarge
                  ?.withColor(
                    context.hint,
                  )
                  .copyWith(
                    fontWeight: FontWeight.w500,
                  ),
              suffixIcon:
                  Icon(_expand ? Icons.arrow_drop_up : Icons.arrow_drop_down),
            ),
            style: widget.textStyle ??
                context.bodyLarge?.withColor(context.secondary).copyWith(
                      fontWeight: FontWeight.w400,
                    ),
          ),
        ),
        ExpandedWidget(
          expand: _expand,
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 200,
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 1.5),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(context.spacing.xs),
                  bottomRight: Radius.circular(context.spacing.xs),
                  topLeft: Radius.zero,
                  topRight: Radius.zero,
                ),
                border: Border.all(
                  color: context.onPrimary,
                ),
              ),
              child: ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: widget.items.length,
                itemBuilder: (context, index) {
                  return CustomInkWell(
                    borderRadius: 0,
                    splashColor: context.primary.withOpacity(0.1),
                    onTap: () {
                      widget.controller!.text = widget.items[index];
                      setState(() {
                        _expand = false;
                      });
                    },
                    child: ListTile(
                      title: Text(
                        widget.items[index],
                        style: context.bodyMedium?.withColor(context.secondary),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: context.onPrimary,
                    height: 0.5,
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _CustomTextField extends StatefulWidget {
  const _CustomTextField({
    Key? key,
    required this.label,
    required this.hint,
    required this.controller,
    required this.keyboardType,
    required this.isPasswordField,
    required this.validator,
    this.textStyle,
    this.suffix,
  }) : super(key: key);

  final Widget? suffix;
  final String label;
  final String hint;
  final TextEditingController? controller;
  final FormFieldValidator? validator;
  final TextInputType? keyboardType;
  final TextStyle? textStyle;
  final bool isPasswordField;

  @override
  State<_CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<_CustomTextField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: widget.textStyle ??
              context.bodyLarge?.withColor(context.secondary).semiBold.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
        ),
        SizedBox(height: context.spacing.xs),
        TextFormField(
          validator: widget.validator,
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.center,
          controller: widget.controller,
          maxLines: 1,
          keyboardType: widget.keyboardType,
          obscureText: widget.isPasswordField ? _isObscure : false,
          decoration: InputDecoration(
            hintText: widget.hint,
            filled: true,
            fillColor: context.onPrimary, // Set your desired background color
            contentPadding: context.spacing.xSmallHV, // Padding around the text
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                context.spacing.xs,
              ), // Set your desired border radius
              borderSide: BorderSide.none, // Remove the border color
            ),
            hintStyle: context.bodyLarge
                ?.withColor(
                  context.hint,
                )
                .copyWith(
                  fontWeight: FontWeight.w500,
                ),

            suffixIcon: CustomInkWell(
              onTap: () {
                setState(() {
                  _isObscure = !_isObscure;
                });
              },
              size: const Size.square(40),
              child: widget.suffix ??
                  (widget.isPasswordField
                      ? Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off,
                        )
                      : const SizedBox()),
            ),
          ),
          style: widget.textStyle ??
              context.bodyLarge?.withColor(context.secondary).copyWith(
                    fontWeight: FontWeight.w400,
                  ),
        ),
      ],
    );
  }
}

class _CustomTextArea extends StatelessWidget {
  const _CustomTextArea({
    Key? key,
    required this.label,
    required this.hint,
    required this.controller,
    required this.validator,
    this.textStyle,
  }) : super(key: key);

  final String label;
  final String hint;
  final TextEditingController? controller;
  final FormFieldValidator? validator;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: textStyle ??
              context.bodyLarge?.withColor(context.secondary).semiBold.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
        ),
        SizedBox(height: context.spacing.xs),
        TextFormField(
          validator: validator,
          controller: controller,
          maxLines: null,
          minLines: 5,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: context.onPrimary,
            contentPadding: context.spacing.xSmallHV,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                context.spacing.xs,
              ),
              borderSide: BorderSide.none, // Remove the border color
            ),
            hintStyle: context.bodyLarge
                ?.withColor(
                  context.hint,
                )
                .copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          style: textStyle ??
              context.bodyLarge?.withColor(context.secondary).copyWith(
                    fontWeight: FontWeight.w400,
                  ),
        ),
      ],
    );
  }
}
