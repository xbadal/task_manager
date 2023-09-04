import 'package:flutter/material.dart';
import 'package:tast_manager/ui/shared/app_colors.dart';
import 'package:tast_manager/ui/shared/dimens.dart';
import 'package:tast_manager/ui/shared/text_styles.dart';

class BusyButton extends StatefulWidget {
  final bool busy;
  final String title;
  final Function onPressed;
  final bool enabled;
  final Color buttonColor;
  final Color splashColor;
  final double width;
  final double height;

  const BusyButton({
    super.key,
    required this.title,
    this.busy = false,
    required this.onPressed,
    this.width = 130,
    this.height = 50,
    this.buttonColor = kcButtonColor,
    this.splashColor = kcAccentColor,
    this.enabled = true,
  });

  @override
  _BusyButtonState createState() => _BusyButtonState();
}

class _BusyButtonState extends State<BusyButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => widget.onPressed(),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(widget.width, widget.height),
        backgroundColor: widget.buttonColor,
        foregroundColor: Colors.white,
        disabledBackgroundColor: Colors.grey[300],
        textStyle: textStylePoppins(fontSize: font_16, fontWeight: FontWeight.w600, color: Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // <-- Radius
        ),
      ),
      child: widget.busy
          ? const SizedBox(
              height: 30.0,
              width: 30.0,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : Text(
              widget.title,
              style: textStylePoppins(fontSize: font_16, fontWeight: FontWeight.w600, color: Colors.white),
            ),
    );
  }
}
