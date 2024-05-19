import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:iconsax/iconsax.dart';
import '../../../common/widgets/appbar/appbar.dart';
import '../../../utils/constants/colors.dart';

class Clients extends StatelessWidget {
  const Clients({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            'Clients List',
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .apply(color: TColors.black),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Iconsax.user_add),
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.search_normal),
                  hintText: "Search by name",
                  contentPadding: const EdgeInsets.all(16.0),
                  fillColor: TColors.grey,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Slidable(
                    endActionPane: ActionPane(
                      extentRatio: .3,
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {},
                          icon: Icons.delete,
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.red[700]!,
                        ),
                      ],
                    ),
                    child: ListTile(
                      isThreeLine: true,
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: size.width * 0.08),
                      leading: const CircleAvatar(
                        radius: 25,
                        backgroundImage:
                        AssetImage("assets/images/user/user5.png"),
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Lakhdarezzine Hanaa",
                              style: TextStyle(fontWeight: FontWeight.w600)),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Iconsax.arrow_right),
                          )
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(
                  color: Colors.grey[400],
                  indent: size.width * .08,
                  endIndent: size.width * .08,
                ),
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
