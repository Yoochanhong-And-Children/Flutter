import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoochanhong_and_children/common/common.dart';
import 'package:yoochanhong_and_children/component/text_field.dart';
import 'package:yoochanhong_and_children/screen/main_page.dart';

class ProtectorRegistrationPage extends StatefulWidget {
  const ProtectorRegistrationPage({Key? key}) : super(key: key);

  @override
  State<ProtectorRegistrationPage> createState() =>
      _ProtectorRegistrationPageState();
}

class _ProtectorRegistrationPageState extends State<ProtectorRegistrationPage> {
  late TextEditingController userNameController;
  late TextEditingController protectorNameController;
  late TextEditingController phoneNumberController;

  @override
  void initState() {
    super.initState();
    userNameController = TextEditingController();
    protectorNameController = TextEditingController();
    phoneNumberController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
    protectorNameController.dispose();
    phoneNumberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          "보호자 등록",
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
        leading: IconButton(
            onPressed: null, icon: Icon(Icons.arrow_back_ios_new_sharp)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                CustomTextField(
                  width: 328,
                  height: 60,
                  controller: userNameController,
                  helperText: "이름",
                  hintText: "이름을 입력해주세요.",
                  fontSize: 14,
                  maxLength: 20,
                  autofocus: true,
                ),
                SizedBox(height: 50.0.h),
                CustomTextField(
                  width: 328,
                  height: 60,
                  controller: protectorNameController,
                  helperText: "보호자 이름",
                  hintText: "보호자의 이름을 입력해주세요.",
                  fontSize: 14,
                  maxLength: 20,
                  autofocus: false,
                ),
                SizedBox(height: 50.0.h),
                CustomTextField(
                  width: 328,
                  height: 60,
                  controller: phoneNumberController,
                  helperText: "보호자 전화번호",
                  hintText: "보호자의 전화번호를 입력해주세요.",
                  fontSize: 14,
                  maxLength: 20,
                  autofocus: false,
                ),
              ],
            ),
            GestureDetector(
              onTap: () => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const MainPage()),
                  (route) => false),
              child: Container(
                width: 328,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xff5A9D59),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Center(
                  child: Text(
                    "입력 완료",
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
      ),
    );
  }
}
