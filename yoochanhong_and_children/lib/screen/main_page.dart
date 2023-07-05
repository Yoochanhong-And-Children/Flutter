import 'package:flutter/material.dart';
import 'package:transition/transition.dart';
import 'package:yoochanhong_and_children/common/common.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoochanhong_and_children/screen/my_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.backgroundColor,
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 30.0.w, right: 30.0.w, top: 30.0.h),
          child: Column(
            children: [
              SizedBox(height: 80.0.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "유하은",
                            style: TextStyle(
                              fontSize: 44.0.sp,
                              fontFamily: 'PLight',
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 7.0.w, top: 8.0.h),
                            child: Text(
                              "님",
                              style: TextStyle(
                                fontSize: 34.0.sp,
                                fontFamily: 'PLight',
                              ),
                            ),
                          ),
                        ],
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "식사",
                              style: TextStyle(
                                color: Color(0xFF5A9D59),
                                fontSize: 32.sp,
                                fontFamily: 'ExtraBold',
                              ),
                            ),
                            TextSpan(
                              text: "는 하셨나요?",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 32.sp,
                                fontFamily: 'ExtraBold',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 72.0.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "보호자 정보",
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontFamily: 'ExtraBold',
                      color: Color(0xff5A9D59),
                    ),
                  ),
                  SizedBox(height: 10.0.h),
                  Container(
                    width: 370.0.w,
                    height: 90.0.h,
                    decoration: BoxDecoration(
                      color: const Color(0xff5A9D59),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(width: 20.0.w),
                          Text(
                            "양채원",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0.sp,
                              fontFamily: 'ExtraBold',
                            ),
                          ),
                          SizedBox(width: 115.0.w),
                          Text(
                            "010-5845-4856",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0.sp,
                              fontFamily: 'Heavy',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 90.0.h),
              Container(
                width: 320.0.w,
                height: 260.0.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFD7EBD7),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: PageView(
                  pageSnapping: true,
                  controller: pageController,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      width: 320.0.w,
                      height: 260.0.h,
                      decoration: BoxDecoration(
                          color: const Color(0xFFD7EBD7),
                          borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                SizedBox(height: 48.0.h),
                                Image.asset(
                                  "assets/images/chat.png",
                                  width: 60.0.w,
                                  height: 55.0.h,
                                ),
                                SizedBox(height: 35.0.h),
                                GestureDetector(
                                  onTap: () {

                                  },
                                  child: Container(
                                    width: 190.0.w,
                                    height: 62.0.h,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF6BB86A),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "채팅하러 가기",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0.sp,
                                          fontFamily: 'ExtraBold',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 10.0.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 8.05.w,
                                    height: 8.0.h,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF5C5C5C),
                                      borderRadius: BorderRadius.circular(50.r),
                                    ),
                                  ),
                                  SizedBox(width: 5.0.w),
                                  Container(
                                    width: 8.05.w,
                                    height: 8.0.h,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFFFFFF),
                                      borderRadius: BorderRadius.circular(50.r),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 320.0.w,
                      height: 260.0.h,
                      decoration: BoxDecoration(
                          color: const Color(0xffD7EBD7),
                          borderRadius: BorderRadius.circular(20.r)),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                SizedBox(height: 47.0.h),
                                Image.asset(
                                  "assets/images/person.png",
                                  width: 49.0.w,
                                  height: 63.0.h,
                                ),
                                SizedBox(height: 28.0.h),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      Transition(
                                        child: const MyPage(),
                                        transitionEffect: TransitionEffect.RIGHT_TO_LEFT,
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: 190.0.w,
                                    height: 62.0.h,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF6BB86A),
                                      borderRadius: BorderRadius.circular(20.r),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "내 정보 보러가기",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.sp,
                                          fontFamily: 'ExtraBold',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 10.0.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 8.05.w,
                                    height: 8.0.h,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFFFFFF),
                                      borderRadius: BorderRadius.circular(50.r),
                                    ),
                                  ),
                                  SizedBox(width: 5.0.w),
                                  Container(
                                    width: 8.05.w,
                                    height: 8.0.h,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF5C5C5C),
                                      borderRadius: BorderRadius.circular(50.r),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
