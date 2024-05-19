import 'package:flutter/material.dart';
import '../../../utils/constants/sizes.dart';

class TGridLayout extends StatelessWidget {
  const TGridLayout({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.mainAxisExtent = 288,
    this.crossAxisCount = 2,
    this.crossAxisSpacing = Sizes.gridViewSpacing,
    this.mainAxisSpacing = Sizes.gridViewSpacing,
  });

  final int itemCount;
  final double? mainAxisExtent;
  final int crossAxisCount;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisExtent: mainAxisExtent,
        mainAxisSpacing: mainAxisSpacing,
        crossAxisSpacing: crossAxisSpacing,
      ),
      itemBuilder: itemBuilder,
    );
  }
}

// Now, you can easily reuse this grid widget with different settings
// for crossAxisCount, crossAxisSpacing, and mainAxisSpacing.