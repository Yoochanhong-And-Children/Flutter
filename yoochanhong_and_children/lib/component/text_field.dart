import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.width,
    required this.controller,
    required this.fontSize,
    required this.maxLength,
    required this.autofocus,
    this.height,
    this.hintText,
    this.helperText,
    this.textAlign,
    this.textInputType,
  }) : super(key: key);

  final double width;
  final double? height;

  final int? maxLength;
  final int fontSize;
  final TextEditingController controller;
  final String? hintText, helperText;
  final TextInputType? textInputType;
  final TextAlign? textAlign;
  final bool autofocus;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width.w,
      height: widget.height != null ? widget.height!.h : null,
      child: TextFormField(
        controller: widget.controller,
        autofocus: widget.autofocus,
        keyboardType: widget.textInputType,
        textAlign:
            widget.textAlign != null ? widget.textAlign! : TextAlign.start,
        onChanged: (value) => setState(() {}),
        maxLength: widget.maxLength,
        decoration: const InputDecoration(
          counterText: '',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Color(0xffDBD7E0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Color(0xff5A9D59)),
          ),
        ),
      ),
    );
  }
}
