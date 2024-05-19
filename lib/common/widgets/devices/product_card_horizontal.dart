
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../texts/device_title_text.dart';
import '../container/t_rounded_container.dart';
import '../icons/t_circular_icon.dart';
import '../images/t_rounded_image.dart';



class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.productImageRadius),
        color: dark ? TColors.darkerGrey : TColors.softGrey,
      ), // BoxDecoration
      child: Row(
        children: [
        /// Thumbnail
        TRoundedContainer(
             height: 120,
             padding: const EdgeInsets.all(Sizes.sm),
             backgroundColor: dark ? TColors.dark : TColors.light,
             child: const  Stack(
                   children: [
                        /// -- Thumbnail Image
                          SizedBox(
                              height:120,
                               width: 120,
                              child: TRoundedImage(
                               imageUrl: Images.phone,
                                applyImageRadius: true,
                              ),
                                ),

                     /// -- Favourite Icon Button
                     Positioned(
                       top: 0,
                         right: 0,
                         child: TCircularIcon(icon:Iconsax.heart5,color:TColors.error)
                     )



          ],
        ),
      ),

          /// -- Details
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: Sizes.sm, left: Sizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TDeviceTitleText(title: 'Samsung Galaxy-S21', smallSize: true),
                  const SizedBox(height: Sizes.spaceBtwItems / 2),
                  Text('Phone', style: Theme.of(context).textTheme.titleMedium),
                ],
              ),
            ),
          )


      ],
    ),
    );
  }
}