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
            onPressed: null, icon: Icon(Icons.arrow_back_ios_new_rounded),
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
                  child: Text(
                    '유하은 님',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 32.sp,
                    ),
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
                  ),
                ),
              ),
            ),
            SizedBox(height: 196.0.h),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 30.0.w),
                  child: Text(
                    '보호자 정보',
                    style: TextStyle(
                      color: Color(0xFF5A9D59),
                      fontSize: 22.sp
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
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none
                          ),
                          controller: protectorNameController,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 47.0.w),
                  Row(
                    children: [
                      SizedBox(
                        width: 56.0.w,
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
                        ),
                      ),
                      SizedBox(
                        width: 47.0.w,
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
                        ),
                      ),
                      SizedBox(
                        width: 47.0.w,
                        child: TextFormField(
                          maxLength: 4,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
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
