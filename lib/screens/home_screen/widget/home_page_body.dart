import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nike/data.dart';
import 'package:nike/navigation.dart';
import 'package:nike/provider/theme_provider.dart';
import 'package:nike/screens/shoe_screen/shoe_screen.dart';
import 'package:provider/provider.dart';

import '../../../constant.dart';

class HomePageBody extends StatefulWidget {
  HomePageBody({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  final double kBorderRadius = 42;
  late PageController _controller;
  final kmargin = EdgeInsets.only(right: 30, bottom: 30);
  double? pageOffset = 0;
  double viewFraction = 0.75;
  @override
  void initState() {
    super.initState();

    _controller = PageController(initialPage: 0, viewportFraction: viewFraction)
      ..addListener(() {
        setState(() {
          pageOffset = _controller.page;
          // print("page offset ${_controller.page}");
        });
      });
  }

  handlePageChange(int index) {
    final prov = Provider.of<ThemeProvider>(context, listen: false);
    switch (index) {
      case 0:
        prov.changeAccentColor(kYellow);

        break;
      case 1:
        prov.changeAccentColor(kWhite);

        break;
      case 2:
        prov.changeAccentColor(kGold);

        break;
      default:
        prov.changeAccentColor(kYellow);

        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    final deviceData = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Basketball",
                style: kText22.copyWith(
                    color: themeProvider.accentColor,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1),
              ),
              Text(
                "Running",
                style: kText22.copyWith(
                    color: Color(0xFF959699),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1),
              ),
              Text(
                "Traning",
                style: kText22.copyWith(
                    color: Color(0xFF959699),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1),
              ),
              SizedBox(
                width: 90,
              ),
            ],
          ),
        ),
        Expanded(
          // width: deviceData.width * 0.5,
          // height: deviceData.height * 0.5,
          child: TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 200.0, end: 0),
            curve: Curves.fastOutSlowIn,
            duration: const Duration(milliseconds: 750),
            builder: (BuildContext context, double? value, Widget? child) {
              return Transform.translate(
                offset: Offset(value!, 0),
                child: PageView.builder(
                    // physics: CustomScrollPhysics(itemDimension: 200),
                    controller: _controller,
                    itemCount: data.length,
                    onPageChanged: handlePageChange,
                    itemBuilder: (context, index) {
                      double scale = max(viewFraction,
                          (1 - (pageOffset! - index).abs()) + viewFraction);
                      double opacity = min(
                          1, (1 - (pageOffset! - index).abs()) + viewFraction);
                      return Opacity(
                        opacity: opacity,
                        child: GestureDetector(
                          onTap: () =>
                              navigate(context, ShoeScreen(shoe: data[index])),
                          child: Padding(
                            padding: EdgeInsets.only(
                              right: 10,
                              top: 90 - (scale * 30),
                              bottom: 40,
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  width: deviceData.width,
                                  margin: kmargin,
                                  padding: EdgeInsets.only(left: 28, top: 28),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(kBorderRadius),
                                      color: Colors.white),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data[index].displayName,
                                        style: kText20.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        data[index].name,
                                        style: kText24.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        data[index].price,
                                        style: kText24.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        data[index].displayName.split(" ")[0],
                                        style: kText24.copyWith(
                                            fontSize: 64,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey.shade200),
                                      ),
                                      Text(
                                        data[index].displayName.split(" ")[1],
                                        style: kText24.copyWith(
                                            fontSize: 64,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey.shade200),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    width: 100,
                                    height: 90,
                                    margin: kmargin,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft:
                                                Radius.circular(kBorderRadius),
                                            bottomRight:
                                                Radius.circular(kBorderRadius)),
                                        color: themeProvider.accentColor),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.black,
                                      size: 36,
                                    ),
                                  ),
                                ),
                                Positioned(
                                    top: 90,
                                    left: -50,
                                    right: -10,
                                    child: Hero(
                                      tag: data[index].image,
                                      child: Image.asset(
                                        data[index].image,
                                        // height: 300,
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              );
            },
          ),
        ),
      ],
    );
  }
}

// class CustomScrollPhysics extends ScrollPhysics {
//   final double itemDimension;

//   const CustomScrollPhysics(
//       {required this.itemDimension, ScrollPhysics? parent})
//       : super(parent: parent);

//   @override
//   CustomScrollPhysics applyTo(ScrollPhysics? ancestor) {
//     return CustomScrollPhysics(
//         itemDimension: itemDimension, parent: buildParent(ancestor));
//   }

//   double _getPage(ScrollMetrics position, double portion) {
//     // <--
//     return (position.pixels + portion) / itemDimension;
//     // -->
//   }

//   double _getPixels(double page, double portion) {
//     // <--
//     return (page * itemDimension) - portion;
//     // -->
//   }

//   double _getTargetPixels(
//     ScrollMetrics position,
//     Tolerance tolerance,
//     double velocity,
//     double portion,
//   ) {
//     // <--
//     double page = _getPage(position, portion);
//     // -->
//     if (velocity < -tolerance.velocity) {
//       page -= 0.5;
//     } else if (velocity > tolerance.velocity) {
//       page += 0.5;
//     }
//     // <--
//     return _getPixels(page.roundToDouble(), portion);
//     // -->
//   }

//   @override
//   Simulation? createBallisticSimulation(
//       ScrollMetrics position, double velocity) {
//     // If we're out of range and not headed back in range, defer to the parent
//     // ballistics, which should put us back in range at a page boundary.
//     if ((velocity <= 0.0 && position.pixels <= position.minScrollExtent) ||
//         (velocity >= 0.0 && position.pixels >= position.maxScrollExtent)) {
//       return super.createBallisticSimulation(position, velocity);
//     }

//     final Tolerance tolerance = this.tolerance;
//     // <--
//     final portion = (position.extentInside - itemDimension) / 2;
//     final double target =
//         _getTargetPixels(position, tolerance, velocity, portion);
//     // -->
//     if (target != position.pixels) {
//       return ScrollSpringSimulation(spring, position.pixels, target, velocity,
//           tolerance: tolerance);
//     }
//     return null;
//   }

//   @override
//   bool get allowImplicitScrolling => false;
// }
