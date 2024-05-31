import 'package:flutter/material.dart';
import 'package:flutter_sushi_ui/widgets/button.dart';
import 'package:flutter_sushi_ui/widgets/text_style.dart';

import '../widgets/themes.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 25,
              ),
              Text("SushiMan",
                  style: KTextStyle(fontSize: 28, color: Colors.white)
                      .getTextStyle()),
              const SizedBox(
                height: 25,
              ),
              Image.asset(
                'assets/pic2.png',
              ),
              const SizedBox(
                height: 25,
              ),
              Text("The TEST OF JAPANESE FOOD",
                  style: KTextStyle(fontSize: 44, color: Colors.white)
                      .getTextStyle()),
              const SizedBox(
                height: 25,
              ),
              Text(
                "Taste our japanese food from anywhere and anytime",
                style: KTextStyle(fontSize: 16, color: Colors.grey.shade300)
                    .getTextStyle(),
              ),
              const SizedBox(
                height: 25,
              ),
              Kbutton(
                  text: "Get Started",
                  onTap: () {
                    Navigator.of(context).pushNamed('/menu-screen');
                  })
            ],
          ),
        ),
      ),
    );
  }
}
