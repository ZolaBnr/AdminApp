import 'package:flutter/material.dart';

import '../../utils/constants/sizes.dart';

class SpacingStyle {
  // Static constant variable of type EdgeInsetsGeometry
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    // Using EdgeInsets.only to define padding for only specific edges
    top: Sizes.appBarHeight, // Top padding set to TSizes.appBarHeight
    left: Sizes.defaultSpace, // Left padding set to TSizes.defaultSpace
    bottom: Sizes.defaultSpace, // Bottom padding set to TSizes.defaultSpace
    right: Sizes.defaultSpace, // Right padding set to TSizes.defaultSpace
  );
}