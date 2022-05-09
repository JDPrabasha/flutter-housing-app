import 'package:flutter/material.dart';
import 'package:housing_app/custom/BorderBox.dart';
import 'package:housing_app/custom/OptionButton.dart';
import 'package:housing_app/sample_data.dart';
import 'package:housing_app/utils/constants.dart';
import 'package:housing_app/utils/custom_functions.dart';
import 'package:housing_app/utils/widget_functions.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

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
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addVerticalSpace(padding),
                  Padding(
                    padding: sidePadding,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        BorderBox(
                          child: Icon(
                            Icons.menu,
                            color: COLOR_BLACK,
                          ),
                        ),
                        BorderBox(
                          child: Icon(
                            Icons.settings,
                            color: COLOR_BLACK,
                          ),
                        )
                      ],
                    ),
                  ),
                  addVerticalSpace(padding),
                  Padding(
                    padding: sidePadding,
                    child: Text(
                      "City",
                      style: themeData.textTheme.bodyText2,
                    ),
                  ),
                  addVerticalSpace(10),
                  Padding(
                    padding: sidePadding,
                    child: Text(
                      "San Francisco",
                      style: themeData.textTheme.headline1,
                    ),
                  ),
                  const Padding(
                    padding: sidePadding,
                    child: Divider(
                      height: padding,
                      color: COLOR_GREY,
                    ),
                  ),
                  addVerticalSpace(10),
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: [
                      "<\$200",
                      "For Sale",
                      "3-4 Beds",
                      ">1000 sqft"
                    ].map((filter) => ChoiceOption(text: filter)).toList()),
                  ),
                  addVerticalSpace(10),
                  Expanded(
                    child: Padding(
                      padding: sidePadding,
                      child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: RE_DATA.length,
                          itemBuilder: (context, index) {
                            return RealEstateItem(itemData: RE_DATA[index]);
                          }),
                    ),
                  )
                ],
              ),
              Positioned(
                  bottom: 20,
                  width: size.width,
                  child: Center(
                    child: OptionButton(
                      icon: Icons.map_rounded,
                      width: size.width * 0.35,
                      text: "Map View",
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class ChoiceOption extends StatelessWidget {
  final String text;

  const ChoiceOption({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
          color: COLOR_GREY.withAlpha(25),
          borderRadius: BorderRadius.circular(20)),
      child: Text(
        text,
        style: themeData.textTheme.headline5,
      ),
      padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
      margin: const EdgeInsets.only(left: 25),
    );
  }
}

class RealEstateItem extends StatelessWidget {
  final dynamic itemData;
  const RealEstateItem({Key? key, required this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(itemData["image"])),
              Positioned(
                  top: 15,
                  right: 15,
                  child: BorderBox(
                      width: 50,
                      height: 50,
                      child: Icon(
                        Icons.favorite_border,
                        color: COLOR_BLACK,
                      )))
            ],
          ),
          addVerticalSpace(15),
          Row(
            children: [
              Text(
                formatCurrency(itemData["amount"]),
                style: themeData.textTheme.headline1,
              ),
              addHorizontalSpace(10),
              Text(itemData["address"]),
            ],
          ),
          addVerticalSpace(10),
          Text(
            "${itemData["bedrooms"]} bedrooms / ${itemData["bathrooms"]} bathrooms / ${itemData["area"]} sqft",
            style: themeData.textTheme.headline5,
          )
        ],
      ),
    );
  }
}
