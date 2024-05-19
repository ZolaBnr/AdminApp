import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:untitled3/features/repair/clients/clients.dart';
import 'package:untitled3/features/repair/push_notifcations/notification_list.dart';
import '../../utils/constants/colors.dart';
import '../../utils/helpers/helper_functions.dart';
import '../personalisation/screens/seeting01/seeting01.dart';
import 'Chats/screen/home_screen.dart';



class THomeMenu extends StatelessWidget {
  const THomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller= Get.put(NavigationController());
    final dark=HelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
            () => NavigationBar(
              height: 80,
              elevation: 0,
              selectedIndex: controller.selectedIndex.value,
              onDestinationSelected: (index) => controller.selectedIndex.value = index,
               backgroundColor: dark? TColors.black :Colors.white,
              indicatorColor: dark? TColors.white.withOpacity(0.1) :TColors.black.withOpacity(0.1) ,
               destinations: const [
                 NavigationDestination(icon: Icon(Iconsax.user), label: 'Clients'),
              NavigationDestination(icon: Icon(Iconsax.notification), label: 'Notification'),
              NavigationDestination(icon: Icon(Iconsax.message), label: 'chats'),
              NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),

          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),

    );
  }
}

class NavigationController extends GetxController{
  final Rx<int> selectedIndex=0.obs;

  final screens=[const Clients() ,const MessageList(),const HomeScreen (),const SettingScreen01()];
}
