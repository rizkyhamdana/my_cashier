import 'package:flutter/material.dart';
import 'package:my_cashier/config/util/app_theme.dart';
import 'package:my_cashier/presentation/widget/spacing.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.titleText,
    required this.placeholderText,
    required this.textFieldController,
    this.textInputType,
    this.onChanged,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.autoFocus = false,
    this.suffixIcon,
    this.textInputAction = TextInputAction.next,
    this.obscuringCharacter = '•',
    this.validator,
  }) : super(key: key);

  final String? titleText;
  final String placeholderText;
  final TextEditingController textFieldController;
  final TextInputType? textInputType;
  final Function(String)? onChanged;
  final String obscuringCharacter;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final bool autoFocus;
  final Widget? suffixIcon;
  final TextInputAction textInputAction;
  final FormFieldValidator<String?>? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleText != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(titleText!, style: AppTheme.body1()),
                  verticalSpacing(
                    10,
                  ),
                ],
              )
            : Container(),
        TextFormField(
          controller: textFieldController,
          autofocus: autoFocus,
          obscureText: obscureText,
          keyboardType: textInputType,
          obscuringCharacter: obscuringCharacter,
          enabled: enabled,
          readOnly: readOnly,
          onChanged: onChanged,
          textInputAction: textInputAction,
          style: AppTheme.body3(),
          validator: validator,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppTheme.white,
            suffixIconConstraints:
                const BoxConstraints(maxHeight: 28, maxWidth: 36),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            suffixIcon: suffixIcon,
            hintText: placeholderText,
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(4.0),
              ),
              borderSide: BorderSide(color: AppTheme.blackShadow, width: 1),
            ),
            enabledBorder: const OutlineInputBorder(
              // borderSide: BorderSide(color: HexColor('#BDBDBD'), width: 2.0),
              borderRadius: BorderRadius.all(
                Radius.circular(4.0),
              ),
              borderSide: BorderSide(color: AppTheme.blackShadow, width: 1),
            ),
            errorBorder: const OutlineInputBorder(
              // borderSide: BorderSide(color: HexColor('#BDBDBD'), width: 2.0),
              borderRadius: BorderRadius.all(
                Radius.circular(4.0),
              ),
              borderSide: BorderSide(color: Colors.red, width: 0),
            ),
            errorStyle: AppTheme.hintSearch(),
            disabledBorder: InputBorder.none,
            hintStyle: AppTheme.body3(color: AppTheme.blackColor2),
          ),
        ),
      ],
    );
  }
}
