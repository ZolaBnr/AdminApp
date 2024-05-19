import 'package:flutter/material.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,

  });


  @override
  Widget build(BuildContext context) {
    final dark=HelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          height: 150,
          image: AssetImage(
              dark ? Images.lightAppLogo : Images.darkAppLogo),
        ),
        Text(Texts.loginTitle,style: Theme.of(context).textTheme.headlineMedium ),
        const SizedBox (height: Sizes.sm),
        Text(Texts.loginSubTitle, style: Theme.of(context).textTheme.bodyMedium),],
    );
  }
}
