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

  late FixedExtentScrollController riceTimeScrollController =
  FixedExtentScrollController();

  List<String> riceType = [
    '아침',
    '점심',
    '저녁',
  ];

  List<String> riceTime = [
    '0시',
    '1시',
    '2시',
    '3시',
    '4시',
    '5시',
    '6시',
    '7시',
    '8시',
    '9시',
    '10시',
    '11시',
    '12시',
    '13시',
    '14시',
    '15시',
    '16시',
    '17시',
    '18시',
    '19시',
    '20시',
    '21시',
    '22시',
    '23시',
  ];

  bool alarmSetting = false;

  int selectedPickerIndex = 0;

  @override
  void initState() {
    super.initState();
    protectorNameController.text = 'Text';
    protectorNumber1Controller.text = '010';
    protectorNumber2Controller.text = '1234';
    protectorNumber3Controller.text = '5678';
    riceTimeScrollController = FixedExtentScrollController(initialItem: 0);
  }

  @override
  void dispose() {
    super.dispose();
    protectorNameController.dispose();
    protectorNumber1Controller.dispose();
    protectorNumber2Controller.dispose();
    protectorNumber3Controller.dispose();
  }

  void nextPicker() {
    setState(() {
      if (selectedPickerIndex == 2) {
        Navigator.of(context).pop();
        selectedPickerIndex = 0;
      } else if (selectedPickerIndex < 2) {
        selectedPickerIndex++;
      }
    });
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
            icon: const Icon(
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
                color: const Color(0xFF5A9D59),
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
            SizedBox(height: 75.0.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 30.0.w),
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return StatefulBuilder(
                          builder: (context, setState) {
                            return CupertinoAlertDialog(
                              title: Text(
                                riceType[selectedPickerIndex],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.sp,
                                  fontFamily: 'ExtraBold',
                                ),
                              ),
                              content: Column(
                                children: [
                                  SizedBox(
                                    height: 20.0.h,
                                  ),
                                  CupertinoPicker(
                                    scrollController: riceTimeScrollController,
                                    itemExtent: 50.0.h,
                                    onSelectedItemChanged: (int index) {
                                      setState(() {

                                      });
                                    },
                                    children: riceTime
                                        .map<Widget>((item) => Center(
                                          child: Text(
                                      item,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 24.sp,
                                          fontFamily: 'ExtraBold',
                                      ),
                                    ),
                                        ))
                                        .toList(),
                                  ),
                                  const SizedBox(height: 16.0),
                                ],
                              ),
                              actions: [
                                CupertinoDialogAction(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    selectedPickerIndex = 0;
                                  },
                                  child: Text(
                                    '취소',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.sp,
                                      fontFamily: 'ExtraBold',
                                    ),
                                  ),
                                ),
                                Container(
                                  color: const Color(0xFF5A9D59),
                                  child: CupertinoDialogAction(
                                    onPressed: () {
                                      setState(() {
                                        nextPicker();
                                      });
                                    },
                                    child: Text(
                                      '다음',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.sp,
                                        fontFamily: 'ExtraBold',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    );

                  },
                  child: Container(
                    width: 370.0.w,
                    height: 90.0.h,
                    decoration: BoxDecoration(
                      color: const Color(0xFF5A9D59),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 50.0.w),
                        Text(
                          '식사 시간 알림 설정하기',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.sp,
                            fontFamily: 'ExtraBold',
                          ),
                        ),
                        SizedBox(width: 40.0.w),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.0.h),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 30.0.w),
                  child: Text(
                    '보호자 정보',
                    style: TextStyle(
                      color: const Color(0xFF5A9D59),
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
                color: const Color(0xFF5A9D59),
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
                          decoration: const InputDecoration(
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
                            decoration: const InputDecoration(
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
                          decoration: const InputDecoration(
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
                          decoration: const InputDecoration(
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
                                    color: const Color(0xFFC3C3C3),
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
                                    color: const Color(0xFF3F853E),
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
                  color: const Color(0xFFDAEEDA),
                  borderRadius: BorderRadius.circular(15.r)
                ),
                child: Center(
                  child: Text(
                    '변경',
                    style: TextStyle(
                      color: const Color(0xFF5A9D59),
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
