import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingRings extends StatelessWidget {
  const LoadingRings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.discreteCircle(
        color: Theme.of(context).colorScheme.secondary,
        secondRingColor: Theme.of(context).colorScheme.surface,
        size: 100,
      ),
    );
  }
}
