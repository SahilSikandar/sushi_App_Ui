import 'package:flutter/material.dart';
import 'package:flutter_sushi_ui/model/food_model.dart';
import 'package:flutter_sushi_ui/model/shop.dart';
import 'package:flutter_sushi_ui/widgets/button.dart';
import 'package:flutter_sushi_ui/widgets/text_style.dart';
import 'package:flutter_sushi_ui/widgets/themes.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: secondaryColor,
        appBar: AppBar(
          backgroundColor: secondaryColor,
          centerTitle: true,
          title: Text(
            "Cart",
            style: KTextStyle(fontSize: 22, color: Colors.white).getTextStyle(),
          ),
        ),
        body: Consumer<Shop>(
          builder: (context, value, child) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: value.cart.length,
                    itemBuilder: (context, index) {
                      final Food food = value.cart[index];
                      final String name = food.name;
                      final String price = food.price;

                      return Container(
                        margin: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
                          title: Text(
                            name,
                            style: KTextStyle(fontSize: 18, color: Colors.white)
                                .getTextStyle(),
                          ),
                          subtitle: Text(
                            '\$$price',
                            style: KTextStyle(fontSize: 16, color: Colors.white)
                                .getTextStyle(),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            color: Colors.white,
                            onPressed: () {},
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Kbutton(text: "Checkout", onTap: () {}),
                )
              ],
            );
          },
        ));
  }
}
