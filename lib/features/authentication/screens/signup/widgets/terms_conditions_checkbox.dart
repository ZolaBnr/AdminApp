import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/signup/signup_controller.dart';

class TTermsAndConditionCheckbox extends StatelessWidget {
  const TTermsAndConditionCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark  = HelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox (  width: 24, height: 24, child: Obx(
                () => Checkbox(
              value: controller.privacyPolicy.value,
              onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value,
            ),
          ),
        ),
        const SizedBox(width: Sizes.spaceBtwItems),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: '${Texts.iAgreeTo} ', style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                text: '${Texts.privacyPolicy} ',
                 style: Theme.of(context).textTheme.bodyMedium!.apply(
                color: dark ? TColors.white : TColors.primary,
                decoration: TextDecoration.underline,
                decorationColor: dark ? TColors.white : TColors.primary,
              )),
              TextSpan(text: '${Texts.and} ', style: Theme.of(context).textTheme.labelMedium),
              TextSpan(text: '${Texts.termsOfUse} ', style: Theme.of(context).textTheme.labelLarge!.apply(
                color: dark ? TColors.white : TColors.primary,
                decoration: TextDecoration.underline,
                decorationColor: dark ? TColors.white : TColors.primary,
              )),
            ],
          ),
        ),
      ],
    );
  }
}
