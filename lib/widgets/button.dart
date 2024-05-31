import 'package:flutter/material.dart';
import 'package:flutter_sushi_ui/widgets/text_style.dart';

class Kbutton extends StatelessWidget {
  final String text;
  final Function()? onTap;
  const Kbutton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 94, 35, 30),
            borderRadius: BorderRadius.circular(30)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style:
                  KTextStyle(fontSize: 16, color: Colors.white).getTextStyle(),
            ),
            const SizedBox(
              height: 10,
            ),
            const Icon(
              Icons.arrow_forward,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
