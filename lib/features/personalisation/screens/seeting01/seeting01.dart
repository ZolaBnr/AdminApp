import'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/custom_shapes/container/primary_header_container.dart';
import '../../../../common/widgets/layouts/list_tiles/setting_menu_tile.dart';
import '../../../../common/widgets/sections/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../repair/profile01/profile01.dart';
import '../../../repair/profile01/user_profile_tile01.dart';







class SettingScreen01 extends StatelessWidget {
  const SettingScreen01({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  /// Appbar
                  TAppBar(title: Text('Account',style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white))),
                  /// user profile card
                  TUserProfileTile01(onPressed: () => Get.to(() => const ProfileScreen01())),
                  const SizedBox(height: Sizes.spaceBtwSections),
                ],
              ),
            ),

            // Body
            Padding(
              padding: const EdgeInsets.all(Sizes.defaultSpace),
              child: Column(
                children: [
                  /// -- Account Settings
                  const TSectionHeading(title: 'Account settings', showActionButton: false),
                  const SizedBox(height: Sizes.spaceBtwItems),
                  const TSettingsMenuTile(icon: Iconsax.notification, title: 'Notifications', subTitle: 'Set any kind of notification message'),
                  const TSettingsMenuTile(icon: Iconsax.security_card, title: 'Account Privacy', subTitle: 'Manage data usage and connected accounts'),

                  /// -- App Settings

                  const SizedBox(height: Sizes.spaceBtwSections),
                  const TSectionHeading(title: 'App Settings', showActionButton: false),
                  const SizedBox(height: Sizes.spaceBtwItems),
                  const TSettingsMenuTile(icon: Iconsax.document_upload, title: 'Load Data', subTitle: 'Upload Data to your Cloud Firebase'),

                  // const TSettingsMenuTile(icon: Iconsax.language_circle,
                  //  title: 'Language',
                  //subTitle: 'Change the language according to your requirements ',
                  //),

                  TSettingsMenuTile(icon: Iconsax.location,
                    title: 'Geolocation',
                    subTitle: 'Set recommendation based on location ',
                    trailing:Switch(value: true, onChanged:(value){}),
                  ),

                  TSettingsMenuTile(icon: Iconsax.security_user,
                    title: 'Safe mode',
                    subTitle: 'the research result is safe for all ages',
                    trailing:Switch(value: false, onChanged: (value){}),
                  ),
                  TSettingsMenuTile(icon: Iconsax.image,
                    title: 'HD photo quality',
                    subTitle: 'Set photo quality to become visible',
                    trailing:Switch(value: false, onChanged: (value){}),
                  ),

                  // -- Logout Button
                  const SizedBox (height: Sizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton (onPressed:(){}, child: const Text('Logout')),
                  ),
                  const SizedBox (height: Sizes.spaceBtwSections * 2.5),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


