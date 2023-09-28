import 'package:flutter/material.dart';
import 'package:my_cashier/config/util/app_theme.dart';

class CustomTab extends StatelessWidget {
  const CustomTab(
      {Key? key,
      this.backgroundColor = AppTheme.blue1,
      this.textColor = AppTheme.white,
      this.textButton = "Action",
      required this.buttonTap,
      this.widthButton,
      this.borderSide = BorderSide.none,
      this.textStyle})
      : super(key: key);

  final double? widthButton;
  final Color backgroundColor;
  final Color textColor;
  final String textButton;
  final BorderSide borderSide;
  final Function() buttonTap;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: MaterialButton(
        elevation: 0,
        onPressed: buttonTap,
        padding: EdgeInsets.symmetric(horizontal: 16),
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          side: borderSide,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          textButton,
          style: textStyle ?? AppTheme.subtitle3(color: textColor),
        ),
      ),
    );
  }
}

class CustomTabActive extends StatelessWidget {
  const CustomTabActive({
    Key? key,
    this.textButton = "Action",
    required this.buttonTap,
    this.widthButton,
  }) : super(key: key);

  final double? widthButton;
  final String textButton;
  final Function() buttonTap;

  @override
  Widget build(BuildContext context) {
    return CustomTab(
      widthButton: widthButton ?? MediaQuery.of(context).size.width,
      backgroundColor: AppTheme.blue1,
      buttonTap: buttonTap,
      textColor: AppTheme.white,
      textButton: textButton,
    );
  }
}

class CustomTabInactive extends StatelessWidget {
  const CustomTabInactive({
    Key? key,
    this.textButton = "Action",
    required this.buttonTap,
    this.widthButton,
  }) : super(key: key);

  final double? widthButton;
  final String textButton;
  final Function() buttonTap;

  @override
  Widget build(BuildContext context) {
    return CustomTab(
      widthButton: widthButton ?? MediaQuery.of(context).size.width,
      backgroundColor: AppTheme.white,
      textColor: AppTheme.blackColor2,
      buttonTap: buttonTap,
      textButton: textButton,
      textStyle: AppTheme.body3(),
    );
  }
}
