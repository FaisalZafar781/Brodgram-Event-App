import 'package:brogam/widgets/CurvedEdges/custom_curved_edges.dart';
import 'package:flutter/material.dart';

class CurvedEdges extends StatelessWidget {
  const CurvedEdges({
    super.key,
    this.child,
  });
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomCurvedEdges(),
      child: child,
    );
  }
}
