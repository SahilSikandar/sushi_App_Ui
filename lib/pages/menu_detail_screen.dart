import 'package:flutter/material.dart';
import 'package:flutter_sushi_ui/model/food_model.dart';
import 'package:flutter_sushi_ui/model/shop.dart';
import 'package:flutter_sushi_ui/widgets/button.dart';
import 'package:flutter_sushi_ui/widgets/text_style.dart';
import 'package:flutter_sushi_ui/widgets/themes.dart';
import 'package:provider/provider.dart';

class MenuDetailScreen extends StatefulWidget {
  final Food food;
  const MenuDetailScreen({super.key, required this.food});

  @override
  State<MenuDetailScreen> createState() => _MenuDetailScreenState();
}

class _MenuDetailScreenState extends State<MenuDetailScreen> {
  int _increment = 0;

  void _addItem() {
    setState(() {
      _increment++;
    });
  }

  void _removeItem() {
    if (_increment <= 0) {
      setState(() {
        _increment = 0;
      });
    } else {
      setState(() {
        _increment--;
      });
    }
  }

  void addToCart() {
    if (_increment > 0) {
      Provider.of<Shop>(context, listen: false)
          .addItem(_increment, widget.food);

      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text("Item Added Sucessfully"),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.check_sharp))
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ListView(
                children: [
                  Image.asset(
                    widget.food.imgPath,
                    height: 300,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow[600],
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.food.ratings,
                        style: KTextStyle(fontSize: 16, color: Colors.grey)
                            .getTextStyle(),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.food.name,
                    style: KTextStyle(fontSize: 25, color: Colors.black)
                        .getTextStyle(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Description",
                    style: KTextStyle(fontSize: 18, color: Colors.black)
                        .getTextStyle(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                      "Delight in our exquisite sushi rolls, expertly crafted with fresh, premium ingredients. Savor the perfect balance of flavors in every bite, served with precision and elegance. Elevate your dining experience with our irresistible selection of sushi delights.",
                      style: TextStyle(
                          height: 2, color: Colors.grey, fontSize: 14)),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            //margin: EdgeInsets.all(25),
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
                color: primaryColor, borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${widget.food.price}',
                      style: KTextStyle(fontSize: 18, color: Colors.white)
                          .getTextStyle(),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: secondaryColor),
                          child: IconButton(
                              onPressed: _removeItem,
                              icon: Icon(
                                Icons.remove,
                                color: Colors.white,
                              )),
                        ),
                        SizedBox(
                          width: 40,
                          child: Center(
                            child: Text(
                              _increment.toString(),
                              style:
                                  KTextStyle(fontSize: 18, color: Colors.white)
                                      .getTextStyle(),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: secondaryColor, shape: BoxShape.circle),
                          child: IconButton(
                              onPressed: _addItem,
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                              )),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Kbutton(text: "Add to cart", onTap: addToCart)
              ],
            ),
          )
        ],
      ),
    );
  }
}
