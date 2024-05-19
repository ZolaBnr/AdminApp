
import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../styles/shadows .dart';
import '../../texts/device_title_text.dart';
import '../images/t_rounded_image.dart';


class TDeviceCardVertical extends StatelessWidget {
  const TDeviceCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        boxShadow: [TShadowStyle.verticalProductShadow],
        borderRadius: BorderRadius.circular(Sizes.productImageRadius),
        color: dark ? TColors.darkerGrey : TColors.white,
      ),
      child: Column(
        children: [

                   /// Thumbnail Image
                     const TRoundedImage(imageUrl: Images.phone, applyImageRadius: true),



          /// Favourite icon
            ///  const Positioned(
               ///top: 0 ,
               /// right: 0 ,
                /// child: TCircularIcon(icon: Iconsax.heart5,color: TColors.error),
         /// ),

          /// Details

          Padding(
            padding:  const EdgeInsets.only(left: Sizes.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TDeviceTitleText(title:'Presented on Nov 07,2024',smallSize: true),
                const SizedBox(height: Sizes.spaceBtwItems / 2),
                Row(
                  children: [
                    Text('Samsung Galaxy-S21', overflow: TextOverflow.ellipsis, maxLines: 2, style: Theme.of(context).textTheme.labelMedium ?.copyWith(color: Colors.black),),
                    const SizedBox(width: Sizes.md),

                  ],
                ),


              ],

            ),
          ),

    ],
      ),
      );

  }

}
