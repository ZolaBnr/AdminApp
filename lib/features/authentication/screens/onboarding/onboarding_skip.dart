import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../login/login.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: DeviceUtils.getAppBarHeight(),
        right: Sizes.defaultSpace,
        child: TextButton(onPressed: () => Get.to(()=> const LoginScreen()), child:const Text('Skip')),
        );
  }
}