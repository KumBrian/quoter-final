import 'package:flutter/material.dart';

class SwiperIndicator extends StatelessWidget {
  const SwiperIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(10, (index) {
          return SizedBox(
              height: 20,
              width: 20,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 3),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    shape: BoxShape.circle),
              ));
        }),
      ),
    );
  }
}
