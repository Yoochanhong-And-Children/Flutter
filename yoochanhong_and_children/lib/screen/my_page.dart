import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoochanhong_and_children/common/common.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  TextEditingController protectorNameController = TextEditingController();
  TextEditingController protectorNumber1Controller = TextEditingController();
  TextEditingController protectorNumber2Controller = TextEditingController();
  TextEditingController protectorNumber3Controller = TextEditingController();
  FocusNode protectorNum1FocusNode = FocusNode();
  FocusNode protectorNum2FocusNode = FocusNode();
  FocusNode protectorNum3FocusNode = FocusNode();

  bool alarmSetting = false;

  @override
  void initState() {
    super.initState();
    protectorNameController.text = 'Text';
    protectorNumber1Controller.text = '010';
    protectorNumber2Controller.text = '1234';
    protectorNumber3Controller.text = '5678';
  }

  @override
  void dispose() {
    super.dispose();
    protectorNameController.dispose();
    protectorNumber1Controller.dispose();
    protectorNumber2Controller.dispose();
    protectorNumber3Controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0.h),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 30.0.w),
                  child: Row(
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
                ),
              ],
            ),
            SizedBox(height: 40.0.h),
            Container(
              width: 346.0.w,
              height: 44.0.h,
              decoration: BoxDecoration(
                color: Color(0xFF5A9D59),
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: Center(
                child: Text(
                  '노인을 위한 나라는 없다',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontFamily: 'Bold',
                  ),
                ),
              ),
            ),
            SizedBox(height: 60.0.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 30.0.w),
                child: SizedBox(
                  width: 250.0.w,
                  height: 44.0.h,
                  child: Row(
                    children: [
                      Text(
                        '식사 시간 알림',
                        style: TextStyle(
                          color: Color(0xFF5A9D59),
                          fontSize: 22.sp,
                          fontFamily: 'ExtraBold',
                        ),
                      ),
                      SizedBox(width: 30.0.w),
                      CupertinoSwitch(
                        value: alarmSetting,
                        onChanged: (bool value) {
                          setState(() {
                            alarmSetting = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 86.0.h),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 30.0.w),
                  child: Text(
                    '보호자 정보',
                    style: TextStyle(
                      color: Color(0xFF5A9D59),
                      fontSize: 22.sp,
                      fontFamily: 'ExtraBold',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0.h),
            Container(
              width: 370.0.w,
              height: 90.0.h,
              decoration: BoxDecoration(
                color: Color(0xFF5A9D59),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: 140.0.w,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.0.w),
                        child: TextFormField(
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontFamily: 'ExtraBold',
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none
                          ),
                          controller: protectorNameController,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 25.0.w),
                  Row(
                    children: [
                      SizedBox(
                        width: 60.0.w,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.0.w),
                          child: TextFormField(
                            maxLength: 3,
                            onChanged: (value) {
                              if (value.length == 3) {
                                FocusScope.of(context).requestFocus(protectorNum2FocusNode);
                              }
                            },
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontFamily: 'Heavy'
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              counterText: '',
                            ),
                            focusNode: protectorNum1FocusNode,
                            controller: protectorNumber1Controller,
                          ),
                        ),
                      ),
                      Text(
                        '-',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontFamily: 'Heavy',
                        ),
                      ),
                      SizedBox(
                        width: 55.0.w,
                        child: TextFormField(
                          maxLength: 4,
                          onChanged: (value) {
                            if (value.length == 4) {
                              FocusScope.of(context).requestFocus(protectorNum3FocusNode);
                            }
                          },
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontFamily: 'Heavy',
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            counterText: '',
                          ),
                          focusNode: protectorNum2FocusNode,
                          controller: protectorNumber2Controller,
                        ),
                      ),
                      Text(
                        '-',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontFamily: 'Heavy',
                        ),
                      ),
                      SizedBox(
                        width: 55.0.w,
                        child: TextFormField(
                          maxLength: 4,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontFamily: 'Heavy',
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            counterText: '',
                          ),
                          focusNode: protectorNum3FocusNode,
                          controller: protectorNumber3Controller,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.0.h),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) => SizedBox(
                    child: AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      content: SizedBox(
                        width: 370.0.w,
                        height: 80.0.h,
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.only(top: 10.0.h),
                            child: Text(
                              '변경하시겠습니까?',
                              style: TextStyle(
                                fontSize: 24.0.sp,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'ExtraBold',
                              ),
                            ),
                          ),
                        ),
                      ),
                      actions: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 10.0.h),
                              child: GestureDetector(
                                onTap: () {

                                },
                                child: Container(
                                  width: 119.0.w,
                                  height: 55.0.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    color: Color(0xFFC3C3C3),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '되돌리기',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.sp,
                                        fontFamily: 'ExtraBold',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 10.0.h),
                              child: GestureDetector(
                                onTap: () {

                                },
                                child: Container(
                                  width: 119.0.w,
                                  height: 55.0.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    color: Color(0xFF3F853E),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '변경하기',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.sp,
                                        fontFamily: 'ExtraBold',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: Container(
                width: 74.0.w,
                height: 40.0.h,
                decoration: BoxDecoration(
                  color: Color(0xFFDAEEDA),
                  borderRadius: BorderRadius.circular(15.r)
                ),
                child: Center(
                  child: Text(
                    '변경',
                    style: TextStyle(
                      color: Color(0xFF5A9D59),
                      fontSize: 18.sp,
                      fontFamily: 'ExtraBold',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
