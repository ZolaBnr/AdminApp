import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/loaders/animations_loader.dart';
import '../constants/colors.dart';
import '../helpers/helper_functions.dart';

/// A utility class for managing a full-screen loading dialog
class TFullScreenLoader {
  /// Open a full-screen loading dialog with a given text and animation
  /// This method doesn't return anything
  ///
  /// Parameters
  /// - text: the text to be displayed in the loading dialog
  /// - animation: the Lottie animation to be shown
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      // Use Get.overlayContext for overlay dialogs
      barrierDismissible: false,
      // The dialog can't be dismissed by tapping outside it
      builder: (_) {
        return PopScope(
          canPop: false,
          child: Container(
            color: HelperFunctions.isDarkMode(Get.context!)
                ? TColors.dark
                : TColors.white,
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                const SizedBox(height: 250),
                TAnimationLoaderWidget(
                  text: text,
                  animation: animation,
                  actionText: '',
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Stop the currently open loading dialog
  /// This method doesn't return any value
  static void stopLoading() {
    Navigator.of(Get.overlayContext!).pop(); // Close the dialog using the navigator
  }
}