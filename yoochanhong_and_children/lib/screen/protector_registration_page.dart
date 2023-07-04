import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoochanhong_and_children/common/common.dart';
import 'package:yoochanhong_and_children/component/text_field.dart';

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
          children: [
            SizedBox(height: 20.0.h),
            CustomTextField(
              width: 328,
              height: 60,
              controller: userNameController,
              fontSize: 14,
              maxLength: 20,
              autofocus: false,
            ),
            SizedBox(height: 20.0.h),
            CustomTextField(
              width: 328,
              height: 60,
              controller: protectorNameController,
              fontSize: 14,
              maxLength: 20,
              autofocus: false,
            ),
            SizedBox(height: 20.0.h),
            CustomTextField(
              width: 328,
              height: 60,
              controller: phoneNumberController,
              fontSize: 14,
              maxLength: 20,
              autofocus: false,
            ),
          ],
        ),
      ),
    );
  }
}
