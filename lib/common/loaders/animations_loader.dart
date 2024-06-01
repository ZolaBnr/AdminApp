import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled3/utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';


///Awidget for displaying an animated indicotor with optional text and action button
class TAnimationLoaderWidget extends StatelessWidget {
  ///Default constructor for the TAnimationLoaderWidget
  ///
  /// Parameters:
  /// -Text: the text to be displayrd the animation
  /// -animation: the path to the lottie animation file
  /// -showAction :whether to show an action button below the text
  /// -actionText: the text to be displayed an the action button
  /// onActionPressed: callback function to be executed when the action button is pressed
  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  const TAnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            animation,
            width: MediaQuery.of(context).size.width * 0.8, ), //Display Lottie animation
          const SizedBox(height: Sizes.defaultSpace),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: Sizes.defaultSpace),
          showAction
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                    onPressed: onActionPressed,
                    style:
                        OutlinedButton.styleFrom(backgroundColor: TColors.dark),
                    child: Text(
                       actionText!,
                       style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          !.apply(color: TColors.light),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
