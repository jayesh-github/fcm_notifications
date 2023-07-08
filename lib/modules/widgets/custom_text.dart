import 'package:concept_project/common/values/styles/font_family.dart';
import 'package:flutter/material.dart';

enum CustomFontWeight {
  thin,
  extraLight,
  light,
  regular,
  medium,
  bold,
  semiBold,
  extraBold,
  black
}

class CustomText extends StatelessWidget {
  final String? text;
  final double? size;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final CustomFontWeight? fontWeight;
  final TextOverflow? overflow;
  final double? lineHeightToFontSizeRatio;

  const CustomText(
      {Key? key,
      @required this.text,
      this.size,
      this.color,
      this.textAlign,
      this.maxLines,
      this.lineHeightToFontSizeRatio,
      this.fontWeight = CustomFontWeight.regular,
      this.overflow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
          height: lineHeightToFontSizeRatio,
          color: color,
          fontSize: size,
          fontFamily: getFontFamily(fontWeight),
          fontWeight: getFontWeight(fontWeight),
          decoration: TextDecoration.none),
    );
  }

  String getFontFamily(CustomFontWeight? fontWeight) {
    if (fontWeight == CustomFontWeight.semiBold) {
      return FontFamily.JioTypeBlack;
    } else if (fontWeight == CustomFontWeight.bold ||
        fontWeight == CustomFontWeight.black) {
      return FontFamily.JioTypeBold;
    } else if (fontWeight == CustomFontWeight.medium) {
      return FontFamily.JioTypeMedium;
    } else if (fontWeight == CustomFontWeight.light) {
      return FontFamily.JioTypeLight;
    }
    return FontFamily.JioTypeMedium;
  }

  FontWeight getFontWeight(CustomFontWeight? fontWeight) {
    if (fontWeight == CustomFontWeight.thin) {
      return FontWeight.w100;
    } else if (fontWeight == CustomFontWeight.extraLight) {
      return FontWeight.w200;
    } else if (fontWeight == CustomFontWeight.light) {
      return FontWeight.w300;
    } else if (fontWeight == CustomFontWeight.regular) {
      return FontWeight.w400;
    } else if (fontWeight == CustomFontWeight.medium) {
      return FontWeight.w500;
    } else if (fontWeight == CustomFontWeight.semiBold) {
      return FontWeight.w600;
    } else if (fontWeight == CustomFontWeight.bold) {
      return FontWeight.w700;
    } else if (fontWeight == CustomFontWeight.extraBold) {
      return FontWeight.w800;
    } else if (fontWeight == CustomFontWeight.black) {
      return FontWeight.w900;
    }
    return FontWeight.w400;
  }
}
