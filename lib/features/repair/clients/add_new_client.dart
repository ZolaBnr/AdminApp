import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../common/widgets/appbar/appbar.dart';
import '../../../utils/constants/sizes.dart';

class AddNewClient extends StatelessWidget {
  const AddNewClient({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(showBackArrow: true, title: Text('Add new client ')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Form(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.user), labelText: 'First Name'))),
                    const SizedBox(width: Sizes.spaceBtwinputField),
                    Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.user), labelText: 'Last Name'))),
                  ],
                ),
                const SizedBox(height: Sizes.spaceBtwinputField),
                Row(
                  children: [
                    Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building_31), labelText: 'Adress'))),
                    const SizedBox(width: Sizes.spaceBtwinputField),
                    Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.mobile), labelText: 'PhoneNumber'))),
                  ],
                ),
                const SizedBox(height: Sizes.spaceBtwinputField),

                Row(
                  children: [
                    Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.direct_right), labelText: 'Email'))),
                    const SizedBox(width: Sizes.spaceBtwinputField),
                    Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.password_check), labelText: 'ID'))),
                  ],
                ),


                const SizedBox(height: Sizes.defaultSpace),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Add a client'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}