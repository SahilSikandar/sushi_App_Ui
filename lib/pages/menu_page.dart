import 'package:flutter/material.dart';
import 'package:flutter_sushi_ui/model/food_model.dart';
import 'package:flutter_sushi_ui/model/shop.dart';
import 'package:flutter_sushi_ui/pages/menu_detail_screen.dart';
import 'package:flutter_sushi_ui/widgets/button.dart';
import 'package:flutter_sushi_ui/widgets/text_style.dart';
import 'package:provider/provider.dart';

import '../widgets/menu_item.dart';
import '../widgets/themes.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  void _navigateNext(int index) {
    final shop = Provider.of<Shop>(context, listen: false);
    final menu = shop.menu;
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MenuDetailScreen(food: menu[index]),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final shop = Provider.of<Shop>(context);
    final menu = shop.menu;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Tokyo',
          style: KTextStyle(color: Colors.black, fontSize: 22).getTextStyle(),
        ),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/cart-screen');
              },
              icon: Icon(Icons.shopping_cart))
        ],
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                color: primaryColor, borderRadius: BorderRadius.circular(20)),
            margin: EdgeInsets.symmetric(horizontal: 25),
            padding: EdgeInsets.all(25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'Get 25% Promo',
                      style: KTextStyle(color: Colors.white, fontSize: 22)
                          .getTextStyle(),
                    ),
                    Kbutton(text: "Reedem", onTap: () {})
                  ],
                ),
                Image.asset(
                  'assets/pic2.png',
                  height: 100,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                suffixIcon: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Icon(Icons.search),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Food Menu',
              style:
                  KTextStyle(color: Colors.black, fontSize: 18).getTextStyle(),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: menu.length,
              itemBuilder: (context, index) {
                return MenuItem(
                  food: menu[index],
                  onTap: () => _navigateNext(index),
                );
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin:
                const EdgeInsets.only(left: 25, right: 25, bottom: 25, top: 25),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/pic3.png',
                      height: 60,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Salmon Sushi",
                          style: KTextStyle(fontSize: 18, color: Colors.black)
                              .getTextStyle(),
                        ),
                        Text(
                          "\$${20}",
                          style: KTextStyle(fontSize: 18, color: Colors.grey)
                              .getTextStyle(),
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_outline,
                      size: 28,
                      color: Colors.grey,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
