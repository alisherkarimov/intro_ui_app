import 'package:flutter/material.dart';
import 'package:intro_ui_app/screens/home_screen.dart';
import 'package:intro_ui_app/utils/strings.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  static const id = 'intro_screen';

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  late PageController _pageController;
  int currentIndex = 0;

  @override
  initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) => setState(() => currentIndex = page),
            children: [
              makePage('asssets/images/image_1.png', Strings.stepOneTitle,
                  Strings.stepOneContent),
              makePage('asssets/images/image_2.png', Strings.stepTwoTitle,
                  Strings.stepTwoContent),
              makePage('asssets/images/image_3.png', Strings.stepThreeTitle,
                  Strings.stepThreeContent),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 25, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    if (currentIndex == 2) {
                      Navigator.pushReplacementNamed(context, HomePage.id);
                    }
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      color:
                          currentIndex == 2 ? Colors.redAccent : Colors.white,
                      fontSize: 18,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget makePage(image, title, content) {
    return Container(
      margin: const EdgeInsets.only(left: 50, right: 50, top: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.redAccent,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Text(
            content,
            style: TextStyle(color: Colors.grey.shade400, fontSize: 20),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset(image),
          )
        ],
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 30 : 6,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }

}
