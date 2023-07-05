import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF90CF86),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 273.0.w,
                height: 143.0.h,
                decoration: BoxDecoration(
                  color: Color(0xFF6EB363),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(100.r),
                  )
                ),
              ),
              Container(
                width: 215.0.w,
                height: 177.0.h,
                decoration: BoxDecoration(
                    color: Color(0xFF67A85C),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50.r),
                    )
                ),
              ),
              Container(
                width: 150.0.w,
                height: 233.0.h,
                decoration: BoxDecoration(
                    color: Color(0xFF62A058),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50.r),
                    )
                ),
              ),
              Container(
                width: 82.0.w,
                height: 270.0.h,
                decoration: BoxDecoration(
                    color: Color(0xFF5A9650),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50.r),
                    )
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 157.0.w, top: 728.0.h),
                child: Container(
                  width: 273.0.w,
                  height: 204.0.h,
                  decoration: BoxDecoration(
                      color: Color(0xFF6EB363),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100.r),
                      )
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 215.0.w, top: 693.0.h),
                child: Container(
                  width: 215.0.w,
                  height: 239.0.h,
                  decoration: BoxDecoration(
                      color: Color(0xFF67A85C),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.r),
                      )
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 280.0.w, top: 637.0.h),
                child: Container(
                  width: 150.0.w,
                  height: 295.0.h,
                  decoration: BoxDecoration(
                      color: Color(0xFF62A058),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.r),
                      )
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 348.0.w, top: 602.0.h),
                child: Container(
                  width: 82.0.w,
                  height: 330.0.h,
                  decoration: BoxDecoration(
                      color: Color(0xFF5A9650),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.r),
                      )
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 150.0.w, top: 318.0.h),
                child: Image(
                  image: AssetImage(
                    'assets/images/logo.png',
                  ),
                  width: 130.0.w,
                  height: 233.0.h,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 51.0.w, top: 802.0.h),
                child: Container(
                  width: 328.0.w,
                  height: 60.0.h,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFBF2),
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        spreadRadius: 0,
                        blurRadius: 4.h,
                        offset: Offset(0, 4.0.h),
                      ),
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () {

                    },
                    child: Center(
                      child: Text(
                        '시작하기',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
