import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../../features/authentication/screens/login/login.dart';
import '../../../../features/authentication/screens/onboarding/onboarding.dart';
import '../../../../features/authentication/screens/signup/verify_email.dart';
import '../../../../navigation_menu.dart';
import '../../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../../utils/exceptions/firebase_exceptions.dart';
import '../../../../utils/exceptions/format_exceptions.dart';
import '../../../../utils/exceptions/platforme_exceptions.dart';
import '../user/user_repository.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  ///Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  ///Get authentication User Data
  User? get authUser => _auth.currentUser;

  /// called from main.dart on app launch
  @override
  void onReady(){
    //Remove the native splash screen
    FlutterNativeSplash.remove();
    //Redirect to the appropriate screen
    screenRedirect ();
  }

  ///Function to determine the relevant screen and redirect accordingly
  void screenRedirect () async {
    final user = _auth.currentUser;

    if (user != null){
      //if the user is logged in
      if(user.emailVerified){
        //if the user's email is verified, navigate to the main Navigation Menu
        Get.offAll( () => const NavigationMenu());
      }else {
        //if the user's email in not verified , navigate to the verifyEmail
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email,));
      }
    }else{
      //Local Storage
      deviceStorage.writeIfNull('IsFirstTime', true);
      //Check if it 's the first time launching the app
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll( () => const LoginScreen()) //Redirect to login screen if not the first time
          : Get.offAll(const OnBoardingScreen ());//Redirect to  onBoarding screen if it's  the first time
    }

  }
  /*----------------------- Email & Password sign-in --------------------*/
  /// [EmailAuthentication] -LOGIN
  Future<UserCredential>loginWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e ) {
      throw TFirebaseAuthException( code: '').message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong. Please try again ';
    }
  }
  ///  [EmailAuthentication] -REGISTER
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException( code: '').message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong. Please try again ';
    }
  }

  ///  [EmailAuthentication] -MAIL VERIFICATION
  Future <void> sendEmailVerification () async {
    try {
      return await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong. Please try again ';
    }
  }

  ///  [EmailAuthentication] -FORGET PASSWORD
  Future <void> sendPasswordResetEmail (String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException( code: '').message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong. Please try again ';
    }
  }

  ///  [EmailAuthentication] -Re Authenticate User
  Future <void> reAuthenticateWithEmailAndPassword (String email, String password) async {
    try {
      //Create a credential
      AuthCredential credential =EmailAuthProvider.credential(email: email, password: password);

      //ReAuthenticate
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException( code: '').message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong. Please try again ';
    }
  }
  /*----------------------- Federated identity & social sign-in --------------------*/

  /// [GoogleAuthentication] -GOOGLE
  Future<UserCredential> signInWithGoogle () async {
    try {

      //Trigger the authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      //Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;

      //Create a new credential
      final credentials = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken
      );

      //Once signed in, return the userCredential
      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException( code: '').message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong. Please try again ';
    }
  }
///  [ FacebookAuthentication] -FACEBOOK
/*----------------------- ./end Federated identity & social sign-in --------------------*/

  /// [LogoutUser] -valid for any authentication
  Future <void> logout () async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll( () => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException( code: '').message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong. Please try again ';
    }
  }
  ///  DELETE USER - Remove user Auth and Firestore Account
  Future <void> deleteAccount () async {
    try {
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException( code: '').message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong. Please try again ';
    }
  }


}