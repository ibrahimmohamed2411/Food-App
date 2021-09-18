import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constants/styles.dart';
import 'package:food_app/presentation/screens/onBoarding/widgets/on_boarding_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final CarouselController _carouselController1 = CarouselController();
  final CarouselController _carouselController2 = CarouselController();
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 60),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Welcome',
                  style: KOnBoardingTitleStyle,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: SizedBox(
                child: CarouselSlider(
                  carouselController: _carouselController1,
                  options: CarouselOptions(
                    height: 390,
                    enableInfiniteScroll: false,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.scale,
                    onPageChanged: (index, reason) {
                      setState(() {
                        activeIndex = index;
                        _carouselController2.jumpToPage(index);
                      });
                    },
                  ),
                  items: const [
                    OnBoardingCard(imageName: 'onBoarding1.jpg'),
                    OnBoardingCard(imageName: 'onBoarding2.jpg'),
                    OnBoardingCard(imageName: 'onBoarding3.jpg'),
                  ],
                ),
              ),
            ),
            SizedBox(
              child: CarouselSlider(
                carouselController: _carouselController2,
                options: CarouselOptions(
                  height: 130,
                  viewportFraction: 1,
                  enableInfiniteScroll: false,
                  enlargeStrategy: CenterPageEnlargeStrategy.scale,
                  onPageChanged: (index, reason) {
                    print(index);
                    setState(() {
                      activeIndex = index;
                      _carouselController1.animateToPage(index);
                    });
                  },
                ),
                items: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        'Order',
                        style: KOnBoardingTitleStyle,
                      ),
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Order all you want from your\n favourite stores.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        'Pick Delivery Time',
                        style: KOnBoardingTitleStyle,
                      ),
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Receive your order in less than 1 hour.\n'
                          'Or pick a specific delivery time',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        'Get Your Order',
                        style: KOnBoardingTitleStyle,
                      ),
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Real-time tracking will keep you posted\n'
                          'about order progress.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: AnimatedSmoothIndicator(
                count: 3,
                activeIndex: activeIndex,
                onDotClicked: (index) {
                  _carouselController1.animateToPage(index);
                  _carouselController2.jumpToPage(index);
                },
                effect: SlideEffect(
                    dotWidth: 10,
                    dotHeight: 10,
                    spacing: 18,
                    paintStyle: PaintingStyle.fill,
                    dotColor: Theme.of(context).primaryColor.withOpacity(0.5),
                    activeDotColor: Theme.of(context).primaryColor),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.all(18),
                  child: Text(
                    'Start Now',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
