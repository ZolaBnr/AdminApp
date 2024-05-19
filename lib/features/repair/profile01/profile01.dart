import 'package:flutter/material.dart';
import 'package:untitled3/features/repair/profile01/profile_menu01.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/images/t_circular_image.dart';
import '../../../../common/widgets/sections/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../utils/constants/colors.dart';


class ProfileScreen01 extends StatelessWidget {
  const ProfileScreen01({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(showBackArrow: true, title: Text('Profile')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              /// Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const TCircularImage(image: Images.profile, width: 80, height: 80),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Change profile picture'),
                    ),
                  ],
                ),
              ),
              /// Details
              const SizedBox(height: Sizes.spaceBtwItems / 2),
              const Divider(),
             const SizedBox(height:Sizes.spaceBtwItems ),

              /// Heading Profile Info
              /// Profile Information
            const TSectionHeading(title: 'Profile information', showActionButton: false),
            const SizedBox(height: Sizes.spaceBtwItems),
            TProfileMenu01(title: 'LastName', value: 'Hadj Sadouk', onPressed: () {}),
              TProfileMenu01(title: 'FirstName', value: 'Salah El Eddine', onPressed: () {}),
              TProfileMenu01(title: 'E-mail', value: 'hadj-sadouk@gmail.com', onPressed: () {}),
              TProfileMenu01(title: 'Phone Number', value: '0634220167', onPressed: () {}),
              TProfileMenu01(title: 'Address', value: 'AinDefla', onPressed: () {}),
            const SizedBox(height: Sizes.spaceBtwItems),
            const Divider(),
              const SizedBox(height: Sizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: (){},
                  child: const Text('Close Account',style:TextStyle(color: TColors.error)),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
