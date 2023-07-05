import 'package:flutter/material.dart';
import 'package:yoochanhong_and_children/common/common.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoochanhong_and_children/screen/chatting_page.dart';

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
                      Text(
                        "유하은 님",
                        style: TextStyle(
                          fontSize: 40.0.sp,
                        ),
                      ),
                      Text(
                        "식사는 하셨나요?",
                        style: TextStyle(
                          fontSize: 40.0.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 40.0.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "보호자 정보",
                    style: TextStyle(
                      fontSize: 22,
                      color: Color(0xff5A9D59),
                    ),
                  ),
                  Container(
                    width: 370.0.w,
                    height: 90.0.h,
                    decoration: BoxDecoration(
                      color: const Color(0xff5A9D59),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "양채원",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28.0.sp,
                            ),
                          ),
                          Text(
                            "010-5845-4856",
                            style: TextStyle(
                                color: Colors.white, fontSize: 28.0.sp),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 100.0.h),
              Container(
                width: 320.0,
                height: 260.0,
                decoration: BoxDecoration(
                  color: const Color(0xffD7EBD7),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: PageView(
                  pageSnapping: true,
                  controller: pageController,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      width: 320.0,
                      height: 260.0,
                      decoration: BoxDecoration(
                          color: const Color(0xffD7EBD7),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                SizedBox(height: 40.0.h),
                                Image.asset(
                                  "assets/images/chat.png",
                                  width: 49,
                                  height: 63,
                                ),
                                SizedBox(height: 30.0.h),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ChattingPage()));
                                  },
                                  child: Container(
                                    width: 190,
                                    height: 62,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff6BB86A),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "채팅하러 가기",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24.0.sp,
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
                                    width: 8.05,
                                    height: 8.0,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff5C5C5C),
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                  ),
                                  SizedBox(width: 5.0.w),
                                  Container(
                                    width: 8.05,
                                    height: 8.0,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffFFFFFF),
                                      borderRadius: BorderRadius.circular(50.0),
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
                      width: 320.0,
                      height: 260.0,
                      decoration: BoxDecoration(
                          color: const Color(0xffD7EBD7),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                SizedBox(height: 40.0.h),
                                Image.asset(
                                  "assets/images/person.png",
                                  width: 49,
                                  height: 63,
                                ),
                                SizedBox(height: 30.0.h),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    width: 190,
                                    height: 62,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff6BB86A),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "내 정보 보러가기",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24.0.sp,
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
                                    width: 8.05,
                                    height: 8.0,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffFFFFFF),
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                  ),
                                  SizedBox(width: 5.0.w),
                                  Container(
                                    width: 8.05,
                                    height: 8.0,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff5C5C5C),
                                      borderRadius: BorderRadius.circular(50.0),
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
