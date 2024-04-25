import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:calorie_counter/core/presentation/theme.dart';
import 'package:calorie_counter/core/router/router.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

@RoutePage()
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: OnboardingBody(),
        ));
  }
}

class OnboardingBody extends StatefulWidget {
  const OnboardingBody({
    super.key,
  });

  @override
  State<OnboardingBody> createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends State<OnboardingBody> {
  CarouselController buttonCarouselController = CarouselController();
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        CarouselSlider(
          carouselController: buttonCarouselController,
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              setState(() {
                _pageIndex = index;
              });
            },
            // scrollPhysics: const NeverScrollableScrollPhysics(),
            height: 400,
            enableInfiniteScroll: false,
            viewportFraction: 1,
          ),
          items: const [
            _CarouselItem(imagePath: 'assets/images/onboarding_1.png', title: 'Контролируй количество калорий'),
            _CarouselItem(imagePath: 'assets/images/onboarding_2.png', title: 'Контролируй потребление жидкости'),
            _CarouselItem(imagePath: 'assets/images/onboarding_3.png', title: 'Следи за показателями нормы'),
          ],
        ),
        DotsIndicator(
            dotsCount: 3,
            position: _pageIndex,
            decorator: DotsDecorator(
              activeColor: AppColors.black,
              color: AppColors.black.withOpacity(0.3),
            )),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ElevatedButton(
            onPressed: () {
              if (_pageIndex == 2) {
                AutoRouter.of(context).replace(const DashBoardRoute());
              } else {
                buttonCarouselController.nextPage();
              }
            },
            child: Text(_pageIndex == 2 ? 'Готово' : 'Продолжить'),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class _CarouselItem extends StatelessWidget {
  const _CarouselItem({required this.imagePath, required this.title});
  final String imagePath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(imagePath, height: 300),
        const SizedBox(height: 12),
        AutoSizeText(
          title,
          style: AppTextStyle.s20w700,
          textAlign: TextAlign.center,
          maxLines: 2,
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
