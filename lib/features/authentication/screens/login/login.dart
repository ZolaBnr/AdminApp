import 'package:flutter/material.dart';
import '../../../../common/styles/spacing_styles.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import 'login_form.dart';
import 'login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: SpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              ///Hrader
              LoginHeader(),
              ///Form
              LoginForm(),
              ///Divider
              FormDivider(dividerText:Texts.orSignInWith),
              SizedBox(height: Sizes.spaceBtwSections),
              /// Footer
              SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}


















