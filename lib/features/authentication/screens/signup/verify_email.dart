import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/success_screen/success_screen.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../login/login.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, String? email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => const LoginScreen()),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        // Padding to Give Default Equal Space on alt sides in all screens.
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              /// Image
              Image(image:const AssetImage(Images.deliveredEmailIllustartion),width: HelperFunctions.screenWidth() * 0.6),
              const SizedBox(height: Sizes.spaceBtwSections),

              /// Title & SubTitle
              Text(Texts.confirmEmail,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center),
              const SizedBox(height: Sizes.spaceBtwItems),
              Text('hanaalz128@gmail.com',style: Theme.of(context).textTheme.labelLarge,textAlign: TextAlign.center),
              const SizedBox(height: Sizes.spaceBtwItems),
              Text(Texts.confirmEmailSubTitle,style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center),
              const SizedBox(height: Sizes.spaceBtwSections),
              /// Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed:  () =>Get.to(() => SuccessScreen(
                      image:Images.staticSuccessIllustartion,
                      title:Texts.yourAccountCreatedTitle,
                      subtitle:Texts.yourAccountCreatedSubTitle,
                      onPressed: () => Get.to(() => const LoginScreen()),
                    ),),
                    child: const Text(Texts.tContinue)),
              ),
              const SizedBox(height: Sizes.spaceBtwItems),
              SizedBox(width: double.infinity, child: TextButton(onPressed:  () => Get.to(() => const LoginScreen()), child: const Text(Texts.resendEmail))),
            ],
          ),
        ),
      ),
    );
  }
}