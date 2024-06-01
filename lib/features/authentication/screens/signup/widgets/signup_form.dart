import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:untitled3/features/authentication/screens/signup/widgets/terms_conditions_checkbox.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/validators/validation.dart';
import '../../../controllers/signup/signup_controller.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          ///First & Last Name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) => Validator.validateEmptyText('firstName', value),
                  expands: false,
                  decoration: const InputDecoration( labelText: Texts.firstName, prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(width: Sizes.spaceBtwinputField),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) => Validator.validateEmptyText('lastName', value),
                  expands: false,
                  decoration: const InputDecoration(labelText: Texts.lastName,prefixIcon: Icon(Iconsax.user) ),
                ),
              ),
            ],
          ),
          const SizedBox(height: Sizes.spaceBtwinputField),

          /// Username
          TextFormField(
            controller: controller.username,
            validator: (value) => Validator.validateEmptyText('username', value),
            expands: false,
            decoration: const InputDecoration( labelText: Texts.username,prefixIcon: Icon(Iconsax.user_edit) ),
          ),
          const SizedBox(height: Sizes.spaceBtwinputField),

          /// Email
          TextFormField(
            controller: controller.email,
            validator: (value) => Validator.validateEmail(value),
            decoration: const InputDecoration( labelText: Texts.email,prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(height: Sizes.spaceBtwinputField),

          /// Phone Number
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => Validator.validatePhoneNumber(value),
            decoration: const InputDecoration( labelText: Texts.phoneNo,prefixIcon: Icon(Iconsax.call) ),
          ),
          const SizedBox(height: Sizes.spaceBtwinputField),

          /// Password
          Obx(
                () => TextFormField(
                  validator: (value) => Validator.validatePassword(value),
                  controller: controller.password,
                  obscureText: controller.hidePassword.value,
                  decoration: InputDecoration(
                    labelText: Texts.password,
                    prefixIcon: const Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                      onPressed: () =>
                      controller.hidePassword.value =
                      !controller.hidePassword.value,
                      icon: Icon(controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye),
                    ),
                  ),
                ) ,
          ),
          const SizedBox(height: Sizes.spaceBtwinputField),

          /// Terms & Condition Checkbox
          const TTermsAndConditionCheckbox(),
          const SizedBox(height: Sizes.spaceBtwSections),

         /// Sign Up Button
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.signup(),
                  child: const Text(Texts.createAccount))),
        ],
      ),
    );
  }
}

