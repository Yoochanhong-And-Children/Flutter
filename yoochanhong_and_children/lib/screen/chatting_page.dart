import 'package:flutter/material.dart';
import 'package:yoochanhong_and_children/common/common.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChattingPage extends StatefulWidget {
  const ChattingPage({super.key});

  @override
  State<ChattingPage> createState() => _ChattingPageState();
}

class _ChattingPageState extends State<ChattingPage> {
  bool _isTyping = false;

  late TextEditingController textEditingController;
  late ScrollController scrollController;
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    scrollController = ScrollController();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
    scrollController.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
        title: Text(
          "채팅",
          style: TextStyle(fontSize: 28.0.sp, color: Colors.black),
        ),
        centerTitle: true,
      ),
    );
  }
}
