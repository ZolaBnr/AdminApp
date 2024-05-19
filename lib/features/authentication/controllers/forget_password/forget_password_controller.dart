import "package:flutter/cupertino.dart";
import "package:get/get.dart";
import "../../../../common/data/repositories/authentification/authentification_repository.dart";
import "../../../../utils/constants/image_strings.dart";
import "../../../../utils/helpers/network_manager.dart";
import "../../../../utils/popups/full_screen_loader.dart";
import "../../../../utils/popups/loaders.dart";
import "../../screens/password_configuration/reset_password.dart";




class ForgetPasswordController extends GetxController {

  static ForgetPasswordController get instance => Get.find();

  /// Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  /// Send Reset Password EMail
  sendPasswordResetEmail() async {
    try {
      //Start Loading
      TFullScreenLoader.openLoadingDialog('Processing your request', Images.docerAnimation);

      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected ){
        TFullScreenLoader.stopLoading();
        return;
      }

      //Form Validation
      if(!forgetPasswordFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      //Remove loader
      TFullScreenLoader.stopLoading();

      //Show Success Screen
      TLoaders.successSnackBar(title: 'Email sent', message: 'Email Link Sent to Reset your Password.'.tr);

      //Redirect
      Get.to( () => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      //Remove Loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  resendPasswordResetEmail (String email) async {
    try {
      //Start Loading
      TFullScreenLoader.openLoadingDialog(
          'Processing your request', Images.docerAnimation);

      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //send Email to Reset Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      //Remove loader
      TFullScreenLoader.stopLoading();

      //Show Success Screen
      TLoaders.successSnackBar(title: 'Email sent',
          message: 'Email Link Sent to Reset your Password.'.tr);

    } catch (e) {
      //Remove Loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
