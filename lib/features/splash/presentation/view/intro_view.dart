import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:sihaty_app/core/functions/routing.dart';
import 'package:sihaty_app/core/utils/colors.dart';
import 'package:sihaty_app/core/utils/txt_styal.dart';
import 'package:sihaty_app/core/widgets/custom_button.dart';
import 'package:sihaty_app/features/splash/model/intro_model.dart';
import 'package:sihaty_app/features/splash/presentation/view/welcome_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroView extends StatefulWidget {
  const IntroView({super.key});

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  var currentPage = 0;
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          currentPage != 2
              ? TextButton(
                  onPressed: () {
                    navigatorToReplacement(context, const WelcomeView());
                  },
                  child: Text(
                    'تخطي',
                    style: getSmallStyle(
                        fontWeight: FontWeight.w600,
                        context,
                        color: AppColors.primaryColor),
                  ))
              : const SizedBox(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SvgPicture.asset(
                        width: 300,
                        height: 300,
                        listIntro[index].image,
                      ),
                      const Gap(20),
                      Text(
                        listIntro[index].title,
                        style: getTextStyle(context,
                            color: AppColors.primaryColor),
                      ),
                      const Gap(30),
                      Text(
                        listIntro[index].description,
                        style: getBodyStyle(context),
                      ),
                    ],
                  );
                },
                itemCount: listIntro.length,
              ),
            ),
            SizedBox(
              height: 50,
              child: Row(
                children: [
                  SmoothPageIndicator(
                    controller: controller, // PageController
                    count: 3,
                    // forcing the indicator to use a specific direction
                    textDirection: TextDirection.rtl,
                    effect: WormEffect(
                        dotHeight: 10,
                        dotWidth: 15,
                        activeDotColor: AppColors.primaryColor),
                  ),
                  const Spacer(),
                  if (currentPage == 2)
                    CustomButton(
                        height: 45,
                        width: 90,
                        color: AppColors.primaryColor,
                        text: 'هيا بنا',
                        onPressed: () {
                          navigatorToReplacement(context, const WelcomeView());
                        }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}