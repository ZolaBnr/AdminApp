
import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';
import '../../constants.dart';
import 'components/body.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  final int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: const Body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: kPrimaryColor,
        child: const Icon(
          Icons.person_add_alt_1,
          color: Colors.white,
        ),
      ),

    );
  }



  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor,
      automaticallyImplyLeading: false,
      title: Text("Chats",style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white)),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          color: TColors.white,
          onPressed: () {},
        ),
      ],
    );
  }
}
