import 'package:flutter/material.dart';
import 'package:housing_app/custom/BorderBox.dart';
import 'package:housing_app/utils/constants.dart';
import 'package:housing_app/utils/custom_functions.dart';
import 'package:housing_app/utils/widget_functions.dart';

class HouseScreen extends StatelessWidget {
  const HouseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    const double padding = 25;
    final ThemeData themeData = Theme.of(context);
    const sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset("assets/images/image_2.jpg"),
                Positioned(
                  top: 0,
                  child: Container(
                    width: size.width,
                    padding: const EdgeInsets.all(padding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        BorderBox(
                            child: Icon(Icons.arrow_back, color: Colors.black)),
                        BorderBox(
                            child: Icon(Icons.favorite_border,
                                color: Colors.black)),
                      ],
                    ),
                  ),
                )
              ],
            ),
            addVerticalSpace(padding),
            Padding(
              padding: sidePadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "\$200,000",
                    style: themeData.textTheme.headline1,
                  ),
                  addVerticalSpace(5),
                  Text(
                    "Jenison, MI 49428, SF",
                    style: themeData.textTheme.bodySmall,
                  ),
                  addVerticalSpace(padding),
                  Text(
                    "House Information",
                    style: themeData.textTheme.headlineMedium,
                  ),
                  addVerticalSpace(padding),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                    style: themeData.textTheme.bodySmall,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
