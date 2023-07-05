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

  List<String> list = List.empty(growable: true);

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
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          textDirection: TextDirection.ltr,
                          children: [
                            Container(
                              width: (list[index].length * 25).w,
                              height: 59.0.h,
                              decoration: const BoxDecoration(
                                color: Color(0xff6EB96C),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25.0),
                                  topRight: Radius.circular(25.0),
                                  bottomLeft: Radius.circular(25.0),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  list[index],
                                  style: TextStyle(
                                      fontSize: 20.0.sp, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
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
                            onChanged: (value) => setState(() {}),
                            autofocus: true,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              counterText: '',
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
                    list.add(textEditingController.text);
                    textEditingController.clear();
                  }),
                  child: Padding(
                    padding: EdgeInsets.only(right: 25.0.w),
                    child: Container(
                      width: 84.0.w,
                      height: 52.0.h,
                      decoration: BoxDecoration(
                        color: textEditingController.text.isEmpty
                            ? Color(0xffB0B0B0)
                            : Color(0xff6EB96C),
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

class GPTResponse {
  List<Choices>? choices;

  GPTResponse({this.choices});

  GPTResponse.fromJson(Map<String, dynamic> json) {
    if (json['choices'] != null) {
      choices = <Choices>[];
      json['choices'].forEach((v) {
        choices!.add(Choices.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (choices != null) {
      data['choices'] = choices!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Choices {
  int? index;
  Message? message;
  String? finishReason;

  Choices({this.index, this.message, this.finishReason});

  Choices.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    message =
        json['message'] != null ? Message.fromJson(json['message']) : null;
    finishReason = json['finish_reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['index'] = index;
    if (message != null) {
      data['message'] = message!.toJson();
    }
    data['finish_reason'] = finishReason;
    return data;
  }
}

class Message {
  String? role;
  String? content;

  Message({this.role, this.content});

  Message.fromJson(Map<String, dynamic> json) {
    role = json['role'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['role'] = role;
    data['content'] = content;
    return data;
  }
}
