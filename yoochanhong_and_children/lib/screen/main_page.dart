import 'package:flutter/material.dart';
import 'package:transition/transition.dart';
import 'package:yoochanhong_and_children/common/common.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoochanhong_and_children/model/meal_whether.dart';
import 'package:yoochanhong_and_children/screen/chatting_page.dart';
import 'package:yoochanhong_and_children/screen/my_page.dart';

class MainPage extends StatefulWidget {
  MainPage(
      {super.key,
      required this.id,
      required this.name,
      required this.guardianName,
      required this.guardianPhoneNumber});

  int id;
  String name, guardianName, guardianPhoneNumber;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController pageController = PageController(initialPage: 0);
  bool clickYes = false;
  bool clickNo = false;

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
                            widget.name,
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
                      Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "식사",
                                  style: TextStyle(
                                      color: Color(0xFF5A9D59),
                                      fontSize: 32.sp,
                                      fontFamily: 'ExtraBold'),
                                ),
                                TextSpan(
                                  text: "는 하셨나요?",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 32.sp,
                                      fontFamily: 'ExtraBold'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 35.0.h),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (clickYes == false) {
                                  clickYes = true;
                                  clickNo = false;
                                }
                              });
                            },
                            child: Container(
                              width: 181.0.w,
                              height: 90.0.h,
                              decoration: BoxDecoration(
                                color: clickYes == true
                                    ? Color(0xFF5A9D59)
                                    : Color(0xFFB0B0B0),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.r),
                                  bottomLeft: Radius.circular(20.r),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '예',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40.sp,
                                    fontFamily: 'Regular',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 8.0.w),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (clickNo == false) {
                                  clickNo = true;
                                  clickYes = false;
                                }
                              });
                            },
                            child: Container(
                              width: 181.0.w,
                              height: 90.0.h,
                              decoration: BoxDecoration(
                                color: clickNo == true
                                    ? Color(0xFF5A9D59)
                                    : Color(0xFFB0B0B0),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20.r),
                                  bottomRight: Radius.circular(20.r),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '아니오',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40.sp,
                                    fontFamily: 'Regular',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 160.0.h),
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
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ChattingPage()));
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
                                        "대화하러 가기",
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
                                        child: MyPage(
                                          name: widget.name,
                                          id: widget.id,
                                          guardianName: widget.guardianName,
                                          guardianPhoneNumber: widget.guardianPhoneNumber,
                                        ),
                                        transitionEffect:
                                            TransitionEffect.RIGHT_TO_LEFT,
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
