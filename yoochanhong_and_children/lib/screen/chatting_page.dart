import 'package:flutter/material.dart';
import 'package:yoochanhong_and_children/common/common.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChattingPage extends StatefulWidget {
  const ChattingPage({super.key});

  @override
  State<ChattingPage> createState() => _ChattingPageState();
}

class _ChattingPageState extends State<ChattingPage> {
  bool isTyping = false, itMe = false;
  bool isWritingButtonTouch = false;

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
                  itemCount: 1,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                !isWritingButtonTouch
                    ? GestureDetector(
                        onTap: () => setState(() {
                          isWritingButtonTouch = true;
                        }),
                        child: Padding(
                          padding: EdgeInsets.only(left: 25.0.w),
                          child: Container(
                            width: 84.0.w,
                            height: 52.0.h,
                            decoration: BoxDecoration(
                              color: Color(0xffB0B0B0),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Center(
                              child: Text(
                                "글쓰기",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.0.sp),
                              ),
                            ),
                          ),
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.only(left: 25.0.w),
                        child: Container(
                          width: 243.0.w,
                          height: 60.0.h,
                          decoration: BoxDecoration(
                            color: const Color(0xffCCCCCC),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: TextField(
                            controller: textEditingController,
                            cursorColor: Colors.black,
                            autofocus: true,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide:
                                    BorderSide(color: Color(0xffDBD7E0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide:
                                    BorderSide(color: Color(0xffDBD7E0)),
                              ),
                            ),
                          ),
                        ),
                      ),
                !isWritingButtonTouch
                    ? Image.asset(
                        "assets/images/mic_fill.png",
                        width: 57.0.w,
                        height: 52.0.h,
                      )
                    : const SizedBox.shrink(),
                GestureDetector(
                  onTap: () => setState(() {
                    isWritingButtonTouch = false;
                  }),
                  child: Padding(
                    padding: EdgeInsets.only(right: 25.0.w),
                    child: Container(
                      width: 84.0.w,
                      height: 52.0.h,
                      decoration: BoxDecoration(
                        color: Color(0xffB0B0B0),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Text(
                          "보내기",
                          style:
                              TextStyle(color: Colors.white, fontSize: 20.0.sp),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
