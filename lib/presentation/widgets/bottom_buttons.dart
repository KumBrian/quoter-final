import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quoter_final/presentation/widgets/custom_button.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      flex: 2,
      child: Row(
        children: [
          CustomButton(
            icon: CupertinoIcons.shuffle_medium,
            label: 'Shuffle',
            isLiked: false,
          ),
          CustomButton(icon: Icons.favorite, label: 'Like', isLiked: true),
          CustomButton(
            icon: Icons.copy_rounded,
            label: 'Copy',
            isLiked: false,
          ),
        ],
      ),
    );
  }
}
