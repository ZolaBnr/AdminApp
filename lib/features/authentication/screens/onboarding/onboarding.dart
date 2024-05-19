import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../controllers/onboarding/onboarding_controller.dart';
import 'onboarding_dot_navigation.dart';
import 'onboarding_next_button.dart';
import 'onboarding_page.dart';
import 'onboarding_skip.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingController());
    final controller = Get.find<OnBoardingController>();
    return  Scaffold(
      body: Stack(
          children: [
      /// Horizontal Scrollable Pages
       PageView(
         controller: controller.pageController ,
         onPageChanged: controller.updatePageIndicator,
         children: const [
           OnBoardingPage(
             image: Images.onBoardingImage1,
             title: Texts.onBoardingTitle1,
             subtitle: Texts.onBoardingSubTitle1,
           ),
           OnBoardingPage(
             image: Images.onBoardingImage2,
             title: Texts.onBoardingTitle2,
             subtitle: Texts.onBoardingSubTitle2,
           ),
         ],
         ),

            /// Skip button
        const OnBoardingSkip(),

            /// Dot Navigation SmoothPageIndicator
             const OnBoardingDotNavigation(),

            /// Circular Button
            const OnBoardingNextButton()

      ],
      ),
      );
   }
}

