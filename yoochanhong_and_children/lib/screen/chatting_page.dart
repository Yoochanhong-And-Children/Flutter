import 'package:flutter/material.dart';
import 'package:yoochanhong_and_children/common/common.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChattingPage extends StatefulWidget {
  const ChattingPage({super.key});

  @override
  State<ChattingPage> createState() => _ChattingPageState();
}

class _ChattingPageState extends State<ChattingPage> {
  bool _isTyping = false, itMe = false;

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
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: ScrollConfiguration(
              behavior: const ScrollBehavior().copyWith(overscroll: false),
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                width: MediaQuery.of(context).size.width - 40,
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Directionality(
                          textDirection:
                              itMe ? TextDirection.ltr : TextDirection.rtl,
                          child: Row(
                            children: [
                              Container(
                                width: 279.0.w,
                                height: 59.0.h,
                                decoration: const BoxDecoration(
                                  color: Color(0xff6EB96C),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25.0),
                                    topRight: Radius.circular(25.0),
                                    bottomLeft: Radius.circular(25.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20.0),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.black,
                ),
                Container(),
                Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
