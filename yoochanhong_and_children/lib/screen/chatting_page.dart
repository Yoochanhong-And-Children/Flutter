import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:yoochanhong_and_children/common/common.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:yoochanhong_and_children/service/get_gpt_comment.dart';

class ChattingPage extends StatefulWidget {
  const ChattingPage({super.key});

  @override
  State<ChattingPage> createState() => _ChattingPageState();
}

class _ChattingPageState extends State<ChattingPage> {
  bool isTyping = false, itMe = false;
  bool isWritingButtonTouch = false, isListening = false;
  String text = '';

  List<ChattingList> list = List.empty(growable: true);

  SpeechToText speechToText = SpeechToText();
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
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
        title: Text(
          "채팅",
          style: TextStyle(
            fontSize: 24.0.sp,
            fontFamily: 'ExtraBold',
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: ScrollConfiguration(
              behavior: const ScrollBehavior().copyWith(overscroll: false),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: list[index].comment!.length + 60.0.h,
                      decoration: BoxDecoration(
                        color: list[index].isMyMessage!
                            ? const Color(0xffE7E7E7)
                            : const Color(0xff90CF86),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            SizedBox(width: 10.0.w),
                            list[index].isMyMessage!
                                ? Image.asset(
                                    "assets/images/person.png",
                                    width: 30.33.w,
                                    height: 39.0.h,
                                  )
                                : const SizedBox.shrink(),
                            list[index].isMyMessage!
                                ? SizedBox(width: 20.0.w)
                                : const SizedBox.shrink(),
                            Expanded(
                              child: list[index].isMyMessage!
                                  ? Text(
                                      list[index].comment.toString(),
                                      style: TextStyle(
                                        fontSize: 20.0.sp,
                                        fontFamily: 'Bold',
                                        color: Colors.black,
                                      ),
                                      softWrap: true,
                                    )
                                  : AnimatedTextKit(
                                      animatedTexts: [
                                        TyperAnimatedText(
                                          list[index].comment.toString(),
                                          textStyle: TextStyle(
                                            fontSize: 20.0.sp,
                                            fontFamily: 'Bold',
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                      repeatForever: true,
                                      isRepeatingAnimation: false,
                                    ),
                            ),
                          ],
                        ),
                      ),
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
                              color: const Color(0xffB0B0B0),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Center(
                              child: Text(
                                "글쓰기",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0.sp,
                                    fontFamily: 'ExtraBold'),
                              ),
                            ),
                          ),
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.only(left: 25.0.w),
                        child: Container(
                          width: 243.0.w,
                          height: 60.0 >
                                  textEditingController.text.length /
                                      MediaQuery.of(context).size.width *
                                      100
                              ? 60.0.w
                              : (textEditingController.text.length /
                                          MediaQuery.of(context).size.width) *
                                      100 +
                                  60.0.w,
                          decoration: BoxDecoration(
                            color: const Color(0xffCCCCCC),
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(width: 1, color: Colors.black),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 15.0.w),
                            child: Center(
                              child: TextField(
                                controller: textEditingController,
                                cursorColor: Colors.black,
                                onChanged: (value) => setState(() {}),
                                autofocus: true,
                                maxLines: null,
                                keyboardType: TextInputType.text,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.sp,
                                  fontFamily: 'Bold',
                                ),
                                decoration: const InputDecoration(
                                  counterText: '',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                !isWritingButtonTouch
                    ? GestureDetector(
                        onTap: () async {
                          if (!isListening) {
                            var able = await speechToText.initialize();
                            if (able) {
                              setState(() {
                                isListening = true;
                                speechToText.listen(onResult: (result) {
                                  setState(() {
                                    text = result.recognizedWords;
                                  });
                                });
                              });
                            }
                          } else {
                            setState(() {
                              isListening = false;
                            });
                            speechToText.stop().then((value) {
                              setState(() {
                                ChattingList cl = ChattingList(
                                    comment: text, isMyMessage: true);
                                list.add(cl);
                                scrollController.animateTo(
                                  scrollController.position.maxScrollExtent,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeOut,
                                );
                              });
                              gptResponse(text).then((value) {
                                ChattingList cl = ChattingList(
                                    isMyMessage: false,
                                    comment: value.choices![0].message!.content
                                        .toString());
                                setState(() {
                                  list.add(cl);
                                });
                                scrollController.animateTo(
                                  scrollController.position.maxScrollExtent,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeOut,
                                );
                              });
                            });
                          }
                        },
                        child: Image.asset(
                          "assets/images/mic_fill.png",
                          width: 57.0.w,
                          height: 52.0.h,
                        ),
                      )
                    : const SizedBox.shrink(),
                GestureDetector(
                  onTap: () async {
                    setState(() {
                      isWritingButtonTouch = false;
                      ChattingList cl = ChattingList(
                          comment: textEditingController.text,
                          isMyMessage: true);
                      list.add(cl);
                    });
                    scrollController.animateTo(
                      scrollController.position.maxScrollExtent,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                    text = textEditingController.text;
                    textEditingController.clear();
                    gptResponse(text).then((value) {
                      ChattingList cl = ChattingList(
                          isMyMessage: false,
                          comment:
                              value.choices![0].message!.content.toString());
                      setState(() {
                        list.add(cl);
                      });
                      scrollController.animateTo(
                        scrollController.position.maxScrollExtent,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                      );
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 25.0.w),
                    child: Container(
                      width: 84.0.w,
                      height: 52.0.h,
                      decoration: BoxDecoration(
                        color: textEditingController.text.isEmpty
                            ? const Color(0xffB0B0B0)
                            : const Color(0xff6EB96C),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Text(
                          "보내기",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0.sp,
                            fontFamily: 'ExtraBold',
                          ),
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

class ChattingList {
  String? comment;
  bool? isMyMessage;

  ChattingList({this.comment, this.isMyMessage});
}
