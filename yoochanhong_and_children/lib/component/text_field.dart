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
    required this.helperText,
    required this.hintText,
    this.height,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.helperText!,
          style: TextStyle(
            fontSize: 20.0.sp,
            fontFamily: 'Bold',
          ),
        ),
        SizedBox(height: 5.0.h),
        Container(
          width: widget.width.w,
          height: widget.height != null ? widget.height!.h : null,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: TextFormField(
            controller: widget.controller,
            cursorColor: Colors.black,
            autofocus: widget.autofocus,
            keyboardType: widget.textInputType,
            textAlign:
                widget.textAlign != null ? widget.textAlign! : TextAlign.start,
            onChanged: (value) => setState(() {}),
            maxLength: widget.maxLength,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.sp,
              fontFamily: 'Bold',
            ),
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: TextStyle(
                fontSize: 18.0.sp,
                fontFamily: 'Bold',
              ),
              counterText: '',
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(color: Color(0xffDBD7E0), width: 1),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(color: Color(0xff5A9D59), width: 2),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
