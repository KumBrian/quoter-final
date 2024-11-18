import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.icon,
      required this.label,
      required this.isLiked});

  final IconData icon;
  final String label;
  final bool isLiked;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          child: Container(
            decoration: BoxDecoration(
              color: isLiked
                  ? Theme.of(context).colorScheme.brightness != Brightness.dark
                      ? Theme.of(context).colorScheme.surface
                      : Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.brightness != Brightness.dark
                      ? Colors.white
                      : Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Icon(
                icon,
                color: isLiked
                    ? Theme.of(context).colorScheme.brightness !=
                            Brightness.dark
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context).colorScheme.surface
                    : Theme.of(context).colorScheme.brightness !=
                            Brightness.dark
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context).colorScheme.secondary,
                size: 50,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
