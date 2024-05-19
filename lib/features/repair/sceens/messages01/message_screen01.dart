
import 'package:flutter/material.dart';
import '../../constants.dart';
import 'components01/body01.dart';

class MessagesScreen01 extends StatelessWidget {
  const MessagesScreen01({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: const Body01(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Row(
        children: [
           BackButton(),
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/user/user_5.png"),
          ),
         SizedBox(width: kDefaultPadding * 0.75),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Text(
                "Lakhdarezzine Hanaa",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "Active 3m ago",
                style: TextStyle(fontSize: 12),
              )
            ],
          )
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.local_phone),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.videocam),
          onPressed: () {},
        ),
        const SizedBox(width: kDefaultPadding / 2),
      ],
    );
  }
}
