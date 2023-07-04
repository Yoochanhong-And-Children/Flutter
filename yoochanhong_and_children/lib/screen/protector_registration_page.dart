import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoochanhong_and_children/component/text_field.dart';

class ProtectorRegistrationPage extends StatefulWidget {
  const ProtectorRegistrationPage({Key? key}) : super(key: key);

  @override
  State<ProtectorRegistrationPage> createState() => _ProtectorRegistrationPageState();
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
      appBar: AppBar(
        title: Text(
          '보호자 등록 페이지',
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20.0.h),
            CustomTextField(
              width: 352,
              controller: userNameController,
              fontSize: 14,
              maxLength: 20,
              autofocus: false,
            ),
            SizedBox(height: 20.0.h),
            CustomTextField(
              width: 352,
              controller: userNameController,
              fontSize: 14,
              maxLength: 20,
              autofocus: false,
            ),
            SizedBox(height: 20.0.h),
            CustomTextField(
              width: 352,
              controller: userNameController,
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
