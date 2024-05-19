
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled3/features/authentication/screens/signup/widgets/signup_form.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(Texts.signupTitle, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: Sizes.spaceBtwSections),
              /// Form
              const TSignupForm(),
              const SizedBox(height: Sizes.spaceBtwSections),
              /// Divider
              FormDivider(dividerText: Texts.orSignUpWith.capitalize!),
              const SizedBox(height: Sizes.spaceBtwSections),
              /// Social Buttons
              const SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

