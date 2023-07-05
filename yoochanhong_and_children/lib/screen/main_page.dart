import 'package:flutter/material.dart';
import 'package:yoochanhong_and_children/common/common.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.backgroundColor,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 110),
            Text(
              "유하은 님",
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            Text(
              "식사는 하셨나요?",
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "보호자 정보",
                  style: TextStyle(
                    fontSize: 22,
                    color: Color(0xff5A9D59),
                  ),
                ),
                Container(
                  width: 328,
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xff5A9D59),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "양채원",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                          ),
                        ),
                        Text(
                          "010-5845-4856",
                          style: TextStyle(color: Colors.white, fontSize: 24.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 100),
            Container(
              width: 320.0,
              height: 260.0,
              decoration: BoxDecoration(
                color: const Color(0xffD7EBD7),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: PageView(
                pageSnapping: true,
                controller: pageController,
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    width: 320.0,
                    height: 260.0,
                    decoration: BoxDecoration(
                        color: const Color(0xffD7EBD7),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            "assets/images/chat.png",
                            width: 60,
                            height: 55,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 190,
                              height: 62,
                              decoration: BoxDecoration(
                                color: const Color(0xff6BB86A),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Center(
                                child: Text(
                                  "채팅하러 가기",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 320.0,
                    height: 260.0,
                    decoration: BoxDecoration(
                        color: const Color(0xffD7EBD7),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            "assets/images/chat.png",
                            width: 60,
                            height: 55,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 190,
                              height: 62,
                              decoration: BoxDecoration(
                                color: const Color(0xff6BB86A),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Center(
                                child: Text(
                                  "채팅하러 가기",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
