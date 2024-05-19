
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../../common/data/repositories/authentification/authentification_repository.dart';
import '../../../../common/widgets/success_screen/success_screen.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/popups/loaders.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  ///Send Email Whenever Verify Screen appears & set Timer for auto redirect.
  @override
  void onInit() {
    sendEmailVerification ();
    setTimerForAutoRedirect();
    super.onInit();
  }

  ///Send Email Verification Link
  sendEmailVerification()  async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(title: 'email sent ', message:'Please check your inbox and verify your email.');
    } catch(e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
  ///Timer to automatically redirect an Email Verification
  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1),
          (timer) async {
        await FirebaseAuth.instance.currentUser?.reload();
        final user = FirebaseAuth.instance.currentUser;
        if (user?.emailVerified ?? false){
          timer.cancel();
          Get.off( () => SuccessScreen(
            image:Images.staticSuccessIllustartion,
            title:Texts.yourAccountCreatedTitle,
            subtitle:Texts.yourAccountCreatedSubTitle,
            onPressed: () =>  AuthenticationRepository.instance.screenRedirect,
          ),
          );
        }

      },
    );
  }
  ///Manually Check if Email verified
  checkEmailVerificationStatus () async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified){
      Get.off( () => SuccessScreen(
        image:Images.staticSuccessIllustartion,
        title:Texts.yourAccountCreatedTitle,
        subtitle:Texts.yourAccountCreatedSubTitle,
        onPressed: () =>  AuthenticationRepository.instance.screenRedirect,
      ),
      );
    }
  }
}
