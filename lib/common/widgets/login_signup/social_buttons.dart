import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../features/authentication/controllers/login/login_controller.dart';
import '../../../utils/constants/sizes.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children : [
        Container (
          decoration : BoxDecoration ( border : Border.all ( color : Colors.grey ) , borderRadius : BorderRadius.circular ( 100 )),
          child : IconButton (
            onPressed : () => controller.googleSignIn(),
            icon : const Image (
              width : Sizes.iconMd ,
              height : Sizes.iconMd ,
              image : AssetImage ('assets/logos/google-icon.png') ,
            ),
          ),
        ),
        const SizedBox(width: Sizes.spaceBtwItems),

        Container (
          decoration : BoxDecoration ( border : Border.all ( color : Colors.grey ) , borderRadius : BorderRadius.circular ( 100 )),
          child : IconButton (
            onPressed : ( ) { } ,
            icon : const Image (
              width : Sizes.iconMd ,
              height : Sizes.iconMd ,
              image : AssetImage ('assets/logos/facebook-icon.png') ,

            ),
          ),
        ),
      ],
    );
  }
}
