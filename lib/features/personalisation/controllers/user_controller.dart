
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../common/data/repositories/user/user_repository.dart';
import '../../../utils/popups/loaders.dart';
import '../models/user_model.dart';

class UserController extends GetxController {
  static UserCredential get instance => Get.find();

  ///Save user Record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      if (userCredential != null){
        //convert Name to First and Last Name
        final nameParts = UserModel.nameParts(userCredential.user!.displayName ?? '');
        final username = UserModel.generateUsername(userCredential.user!.displayName ?? '');

        //Map Data
        final user = UserModel(
            id: userCredential.user!.uid,
            firstName: nameParts[0],
            lastName: nameParts.length > 1 ? nameParts.sublist(1).join('') : '',
            username: username,
            email: userCredential.user!.email ?? '' ,
            phoneNumber:  userCredential.user!.phoneNumber ?? '' ,
            profilePicture:  userCredential.user!.photoURL ?? ''
        );
        //Save user data
        await UserRepository.instance.saveUserRecord(user);
      }
    }catch (e) {
      TLoaders.warningSnackBar(
          title: 'Data not saved',
          message: 'something went wrong while saving your information. You can re-save your data in your Profile');

    }
  }
}