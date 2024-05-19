import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/validators/validation.dart';
import '../../controllers/login/login_controller.dart';
import '../password_configuration/forget_password.dart';
import '../signup/signup.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController ());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: Sizes.spaceBtwSections),
        child: Column(
          children: [

            /// Email
            TextFormField(
              controller: controller.email,
              validator: (value) => Validator.validateEmail(value),
              decoration: const InputDecoration(prefixIcon: Icon(
                  Iconsax.direct_right), labelText: Texts.email),
            ),
            const SizedBox(height: Sizes.spaceBtwinputField),

            /// password
            Obx(
                  () =>
                  TextFormField(
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
            const SizedBox(height: Sizes.spaceBtwinputField / 2),

            /// Remember Me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Remember Me
                Row(
                  children: [
                    Obx(() => Checkbox(value: controller.rememberMe.value, onChanged: (value) => controller.rememberMe.value = !controller.rememberMe.value)),
                    const Text(Texts.rememberMe),
                  ],
                ),

                // Forget Password
                TextButton(onPressed: () =>Get.to(()=> const ForgetPassword(email: '',)), child: const Text(Texts.forgetPassword)),
              ],
            ),
            const SizedBox(height: Sizes.spaceBtwSections),

            /// Sing In Button
            SizedBox(width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.emailAndPasswordSignIn(), child: const Text(Texts.signIn))),
            const SizedBox(height: Sizes.spaceBtwItems),

            /// Create Account Button
            SizedBox(width: double.infinity,
                child: OutlinedButton(onPressed: () => Get.to(() =>const SignupScreen()), child: const Text(Texts.createAccount))),
          ],
        ),
      ),
    );
  }
}
