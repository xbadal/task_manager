import 'package:flutter/material.dart';
import 'package:tast_manager/ui/shared/app_colors.dart';
import 'package:tast_manager/ui/shared/dimens.dart';
import 'package:tast_manager/ui/shared/text_styles.dart';

class LoginFieldWidget extends StatelessWidget {
  LoginFieldWidget({
    super.key,
    this.hint,
    this.inputAction,
    this.inputType = TextInputType.number,
    this.error,
    this.obscureText = false,
    this.readOnly = false,
    this.prefixIcon,
    this.suffixIcon,
    this.textAlign = TextAlign.center,
    this.onChanged,
    this.controller,
    this.onPressed,
  });

  final Function(String)? onChanged;
  final String? hint;
  final TextInputAction? inputAction;
  final TextInputType inputType;
  final String? error;
  final bool obscureText;
  final bool readOnly;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextAlign textAlign;
  final TextEditingController? controller;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onPressed,
      readOnly: readOnly,
      controller: controller,
      keyboardType: inputType,
      textAlign: textAlign,
      textInputAction: inputAction,
      maxLength: 16,
      style: textStylePoppins(fontSize: font_16, fontWeight: FontWeight.w500),
      onChanged: onChanged,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                size: 24.0,
                color: kcAccentColor,
              )
            : null,
        suffixIcon: suffixIcon != null
            ? Icon(
                suffixIcon,
                size: 24.0,
                color: kcAccentColor,
              )
            : null,
        contentPadding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 16.0),
        border: BorderStyles.auctionTextFieldBorderStyle,
        enabledBorder: BorderStyles.auctionTextFieldBorderStyle,
        disabledBorder: BorderStyles.auctionTextFieldBorderStyle,
        focusedBorder: BorderStyles.auctionTextFieldBorderStyle,
        errorText: error,
        errorMaxLines: 3,
        errorBorder: BorderStyles.errorBorder,
        errorStyle: textStylePoppins(color: Colors.red, fontSize: font_14),
        hintStyle: textStylePoppins(color: Colors.grey, fontSize: font_14),
        filled: true,
        hintText: hint,
        fillColor: Colors.white,
      ),
    );
  }
}

class BorderStyles {
  BorderStyles();

  static const OutlineInputBorder textFieldBorderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(8.0),
    ),
    borderSide: BorderSide(
      color: Colors.grey,
      width: 0.0,
    ),
  );

  static const OutlineInputBorder auctionTextFieldBorderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(8.0),
    ),
    borderSide: BorderSide(
      color: Colors.grey,
      width: 0.0,
    ),
  );

  static const OutlineInputBorder errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(8.0),
    ),
    borderSide: BorderSide(
      color: Colors.red,
      width: 0.5,
    ),
  );
}
