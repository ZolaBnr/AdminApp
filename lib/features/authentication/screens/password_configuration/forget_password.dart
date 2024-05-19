import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/validators/validation.dart';
import '../../controllers/forget_password/forget_password_controller.dart';


class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key, required this.email});
  final String email;


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(Sizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Headings
            Text(Texts.forgetPasswordTitle, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: Sizes.spaceBtwItems),
            Text(Texts.forgetPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: Sizes.spaceBtwSections * 2),
            /// Text field
            Form(
              key: controller.forgetPasswordFormKey,
              child: TextFormField (
                controller: controller.email,
                validator: Validator.validateEmail,
                decoration: const InputDecoration(labelText: Texts.email, prefixIcon: Icon(Iconsax.direct_right)),
              ),
            ),
            const SizedBox(height: Sizes.spaceBtwSections),

            /// Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.off(() => controller.sendPasswordResetEmail()),
                child: const Text(Texts.submit),
              ),
            ), // SizedBox
          ],
        ),
      ),
    );
  }
}