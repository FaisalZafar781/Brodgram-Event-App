import 'package:flutter/material.dart';

class CustomRoundedContainer extends StatelessWidget {
  const CustomRoundedContainer({
    super.key,
    this.width,
    this.height,
    this.radius,
    this.child,
    this.showBorder = false,
    this.borderColor,
    this.backgroundColor,
    this.padding,
    this.margin,
    this.boxShadow,

  });

  final double? width;
  final double? height;
  final double? radius;
  final Widget? child;
  final bool showBorder;
  final Color? borderColor;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final bool? boxShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 10),
        boxShadow: boxShadow == true
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 6.0,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
        color: backgroundColor,
        border: showBorder
            ? Border.all(
                color: borderColor ?? Colors.transparent,
              )
            : null,
      ),
      child: child,
    );
  }
}
