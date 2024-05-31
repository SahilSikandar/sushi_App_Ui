import 'package:flutter/material.dart';
import 'package:flutter_sushi_ui/model/food_model.dart';
import 'package:flutter_sushi_ui/widgets/text_style.dart';

class MenuItem extends StatelessWidget {
  final Food food;
  final void Function()? onTap;
  const MenuItem({super.key, required this.food, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.only(left: 25),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Image.asset(
              food.imgPath,
              height: 200,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              food.name,
              style:
                  KTextStyle(fontSize: 20, color: Colors.black).getTextStyle(),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 160,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${food.price}',
                    style: KTextStyle(fontSize: 16, color: Colors.grey)
                        .getTextStyle(),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Text(
                        food.ratings,
                        style: KTextStyle(fontSize: 16, color: Colors.grey)
                            .getTextStyle(),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
