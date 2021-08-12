import 'package:flutter/material.dart';
import 'package:nike/constant.dart';
import 'package:nike/model/shoe.dart';
import 'package:nike/provider/theme_provider.dart';
import 'package:nike/screens/shoe_screen/widgets/big_button.dart';
import 'package:nike/screens/shoe_screen/widgets/box_widget.dart';
import 'package:nike/screens/shoe_screen/widgets/color_widget.dart';
import 'package:nike/screens/shoe_screen/widgets/size_icon.dart';
import 'package:provider/provider.dart';

class ShoeScreen extends StatefulWidget {
  const ShoeScreen({Key? key, required this.shoe}) : super(key: key);

  final Shoe shoe;

  @override
  _ShoeScreenState createState() => _ShoeScreenState();
}

class _ShoeScreenState extends State<ShoeScreen> with TickerProviderStateMixin {
  late final AnimationController _animationController;

  late final AnimationController _sizeController;

  late String image;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );

    _sizeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 750),
      lowerBound: 0,
      upperBound: 1.7,
    );
    image = widget.shoe.image;

    // _sizeController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _sizeController.dispose();
    super.dispose();
  }

  final _topIcons = 80.0;

  void changeSize(double value) {
    _scale = value / 4;

    setState(() {});
  }

  void changeColor(int index) {
    final prov = Provider.of<ThemeProvider>(context, listen: false);

    switch (index) {
      case 0:
        prov.changeAccentColor(kYellow);
        image = 'assets/images/nike_1_yellow.png';
        break;
      case 1:
        prov.changeAccentColor(kRed);
        image = 'assets/images/nike_1_red.png';
        break;
      case 2:
        prov.changeAccentColor(kGreen);
        image = 'assets/images/nike_1_green.png';
        break;
      default:
        prov.changeAccentColor(kYellow);
        image = 'assets/images/nike_1_yellow.png';
        break;
    }

    setState(() {});
  }

  double _scale = 8 / 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Stack(
        children: <Widget>[
          ///BACK ICON
          Positioned(
            top: _topIcons,
            left: 20,
            child: BoxWidget(
              onPressed: () => Navigator.pop(context),
              child: Icon(
                Icons.arrow_back,
              ),
            ),
          ),

          //BACGROUND COLOR
          TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0.0, end: 1),
            curve: Curves.fastOutSlowIn,
            duration: const Duration(milliseconds: 750),
            builder: (BuildContext context, double? value, Widget? child) {
              return Positioned(
                top: -100,
                right: -220,
                child: Container(
                  width: 450 * value!,
                  height: 450 * value,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Provider.of<ThemeProvider>(context).accentColor,
                  ),
                ),
              );
            },
          ),

          ///HEART ICON
          Positioned(
            top: _topIcons + 10,
            right: 30,
            child: Icon(
              Icons.favorite,
              color: Colors.white,
            ),
          ),

          ///BACKGROUND TEXT
          Positioned.fill(
            top: _topIcons - 400,
            child: Align(
              child: Text(
                widget.shoe.displayName,
                style: kText24.copyWith(
                  color: Colors.white.withOpacity(0.7),
                  fontWeight: FontWeight.w600,
                  fontSize: 110,
                ),
              ),
            ),
          ),

          ///IMAGE ASSET
          Positioned(
            top: _topIcons,
            left: 60,
            child: TweenAnimationBuilder(
              tween: Tween(begin: _scale, end: _scale),
              duration: const Duration(milliseconds: 750),
              curve: Curves.fastOutSlowIn,
              builder: (context, double value, child) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 5000),
                  child: Transform.scale(
                    scale: value,
                    child: Hero(
                      tag: widget.shoe.image,
                      child: Image.asset(
                        image,
                        // widget.shoe.image,
                        width: 200,
                        height: 450,

                        // color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          ///SHOE DATA
          ///
          TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: -15.0, end: 1),
            curve: Interval(
              0.5,
              1,
              curve: Curves.fastOutSlowIn,
            ),
            duration: const Duration(milliseconds: 1450),
            builder: (BuildContext context, double? value, Widget? child) {
              return Positioned(
                bottom: value! * 20,
                left: value * 20,
                right: value * 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.shoe.displayName,
                      style: kText14,
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.shoe.name,
                          style: kText18.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '\$ ${widget.shoe.price} ',
                          style: kText18.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    _StarWidget(),
                    SizedBox(height: 20),
                    Text(
                      'SIZE',
                      style: kText14,
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizeIcon(
                          size: '7',
                          isSelected: _scale == 7 / 4,
                          onPressed: () => changeSize(7),
                        ),
                        SizedBox(width: 20),
                        SizeIcon(
                          size: '8',
                          isSelected: _scale == 8 / 4,
                          onPressed: () => changeSize(8),
                        ),
                        SizedBox(width: 20),
                        SizeIcon(
                          size: '9',
                          isSelected: _scale == 9 / 4,
                          onPressed: () => changeSize(9),
                        ),
                        SizedBox(width: 20),
                        SizeIcon(
                          size: '10',
                          isSelected: _scale == 10 / 4,
                          onPressed: () => changeSize(10),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'COLOR',
                              style: kText14,
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                ColorWidget(
                                  isSelected: image.contains('yellow'),
                                  color: kYellow,
                                  onPressed: () => changeColor(0),
                                ),
                                SizedBox(width: 10),
                                ColorWidget(
                                  isSelected: image.contains('red'),
                                  color: kRed,
                                  onPressed: () => changeColor(1),
                                ),
                                SizedBox(width: 10),
                                ColorWidget(
                                  isSelected: image.contains('green'),
                                  color: kGreen,
                                  onPressed: () => changeColor(2),
                                ),
                              ],
                            ),
                          ],
                        ),
                        BigButton(),
                      ],
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _StarWidget extends StatelessWidget {
  const _StarWidget({Key? key}) : super(key: key);
  final icon = Icons.star;
  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment:MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Icon(
          icon,
          color: Provider.of<ThemeProvider>(context).accentColor,
          size: 18,
        ),
        SizedBox(width: 10),
        Icon(
          icon,
          color: Provider.of<ThemeProvider>(context).accentColor,
          size: 18,
        ),
        SizedBox(width: 10),
        Icon(
          icon,
          color: Provider.of<ThemeProvider>(context).accentColor,
          size: 18,
        ),
        SizedBox(width: 10),
        Icon(
          icon,
          color: Provider.of<ThemeProvider>(context).accentColor,
          size: 18,
        ),
        SizedBox(width: 10),
        Icon(
          icon,
          color: Colors.white,
          size: 18,
        ),
      ],
    );
  }
}
