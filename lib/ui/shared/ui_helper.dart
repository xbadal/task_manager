import 'package:flutter/material.dart';

const Widget horizontalSpaceTiny = SizedBox(width: 5.0);
const Widget horizontalSpaceSmall = SizedBox(width: 10.0);
const Widget horizontalSpaceMediumSmall = SizedBox(width: 16.0);
const Widget horizontalSpaceMedium = SizedBox(width: 25.0);

const Widget verticalSpaceTiny = SizedBox(height: 5.0);
const Widget verticalSpaceSmall = SizedBox(height: 10.0);
const Widget verticalSpaceMediumSmall = SizedBox(height: 16.0);
const Widget verticalSpaceMedium = SizedBox(height: 25.0);
const Widget verticalSpaceLarge = SizedBox(height: 50.0);
const Widget verticalSpaceMassive = SizedBox(height: 120.0);

Widget indentSpacedDivider = Column(
  children: const <Widget>[
    verticalSpaceMediumSmall,
    Divider(
      indent: 16.0,
      endIndent: 16.0,
    ),
    verticalSpaceMediumSmall,
  ],
);

double paddingTop(BuildContext context) => MediaQuery.of(context).padding.top;

Widget verticalSpace(double height) => SizedBox(height: height);

Widget horizontalSpace(double width) => SizedBox(width: width);

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double screenHeightFraction(BuildContext context,
        {int dividedBy = 1, double offsetBy = 0}) =>
    (screenHeight(context) - offsetBy) / dividedBy;

double screenWidthFraction(BuildContext context,
        {int dividedBy = 1, double offsetBy = 0}) =>
    (screenWidth(context) - offsetBy) / dividedBy;

double halfScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 2);

double thirdScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 3);

void onWidgetDidBuild(Function callback) {
  WidgetsBinding.instance!.addPostFrameCallback((_) {
    callback();
  });
}
