import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../common/data/repositories/authentification/authentification_repository.dart';
import '../../../../common/data/repositories/user/user_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';
import '../../../personalisation/models/user_model.dart';
import '../../screens/signup/verify_email.dart';


class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs; //observable for hiding /showing password
  final privacyPolicy = true.obs; //observable for hiding /showing password
  final email = TextEditingController(); // Controller for email input
  final lastName = TextEditingController(); // Controller for last name input
  final username = TextEditingController(); // Controller for username input
  final password = TextEditingController(); // Controller for password input
  final firstName = TextEditingController(); // Controller for first name input
  final phoneNumber = TextEditingController(); // Controller for phone number input
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>(); // Form key for form validation

  /// --SIGNUP
  void signup() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog('we are processing your information ...', Images() as String); //Images.openLoadingDialog

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }

      // Form Validation
      if (!signupFormKey.currentState!.validate()) {
        return;
      }

      // Privacy Policy Check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
          title: 'Accept Privacy Policy ',
          message: 'In order to create account, you must have to read and accept the Privacy Policy & Terms Of Use ',
        );
        return;
      }

      // Register user in the Firebase Authentication & Save user data in the Firebase
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Save Authenticated user data in the Firebase Firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        lastName: lastName.text.trim(),
        firstName: firstName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );
      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Success Message
      TLoaders.successSnackBar(title: 'Congratulation', message: 'Your account has been created. Verify email to continue.');

      // Move to Verify Email Screen
      Get.to(() =>  VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      //show some Geeneric Error to the user
      TLoaders.errorSnackBar(title: 'on snap ', message: e.toString());
    } finally {
      // Remove Loader
      TFullScreenLoader.stopLoading();
    }
  }
}