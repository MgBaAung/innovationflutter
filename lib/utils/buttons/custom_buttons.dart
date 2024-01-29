import 'package:flutter/material.dart';
import 'package:innovation/dimensions/dimension_manager.dart';
import 'package:innovation/theme/app_color.dart';
import 'package:innovation/utils/text_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? textSize;
  final Color? textColor;
  final Color? color;
  final double? width;
  final double? height;
  final IconData? icon;
  final Widget? leadImage;
  final Widget? trailImage;
  final double? iconSize;
  final Color? iconColor;
  final bool? isDisabled;
  final Color? borderColor;
  final double horizontalPadding;
  final double verticalPadding;
  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = AppColor.secondaryColor,
    this.width,
    this.height,
    this.icon,
    this.iconSize,
    this.iconColor,
    this.leadImage,
    this.trailImage,
    this.textSize,
    this.textColor,
    this.borderColor,
    this.isDisabled = false,
    this.horizontalPadding = 0.0,
    this.verticalPadding = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding, vertical: verticalPadding),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isDisabled == true ? color?.withOpacity(0.4) : color,
          minimumSize:
              Size(width ?? DM.screenWidth * 0.8, height ?? DM.width20 * 2.5),
          elevation: 0,
          animationDuration: const Duration(milliseconds: 1000),
          shape: RoundedRectangleBorder(
            side: (borderColor != null)
                ? BorderSide(
                    color: isDisabled == true
                        ? borderColor?.withOpacity(0.4) ?? borderColor!
                        : borderColor!,
                    width: 2)
                : BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          // shadowColor: isDisabled == true ? color?.withOpacity(0.4) : color,
        ),
        onPressed: isDisabled == true ? null : onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leadImage != null)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: DM.width10),
                child: leadImage!,
              ),
            Text(text,
                style: buttonStyle.copyWith(
                    color: textColor ?? AppColor.white, fontSize: DM.font12)),
            if (icon != null) SizedBox(width: DM.width10),
            if (icon != null)
              Icon(
                icon,
                size: iconSize ?? DM.font15,
                color: iconColor ?? AppColor.white,
              ),
            if (trailImage != null)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: DM.width10),
                child: trailImage!,
              )
          ],
        ),
      ),
    );
  }
}
