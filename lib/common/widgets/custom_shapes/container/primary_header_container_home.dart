import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';
import '../curved_edges/curved_edges_widget.dart';
import 'circular_container.dart';



class PrimaryHeaderContainerHome extends StatelessWidget {
  const PrimaryHeaderContainerHome({
    super.key, required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CurvedEdgeWidget(
      child: SizedBox(
        height: 400,
        child: Container(
          color: TColors.primary,
          child: Stack(
            children: [
              // --Background Custom Shapes
              Positioned(top: -150, right: -250, child: CircularContainer(backgroundColor: TColors.textWhite.withOpacity(0.1), margin: null,)),
              Positioned(top: 100, right: -300, child: CircularContainer(backgroundColor: TColors.textWhite.withOpacity(0.1),margin: null,)),
              child,
            ],
          ),
        ),
      ),
    );
  }
}



