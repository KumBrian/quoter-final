import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        width: 250,
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.cancel_sharp,
                  size: 50,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: TextButton(
                style: ButtonStyle(
                  padding: WidgetStateProperty.all(EdgeInsets.zero),
                ),
                onPressed: () {},
                child: Text(
                  'FAVORITES',
                  style: GoogleFonts.getFont('Montserrat',
                      fontSize: 24,
                      color: Theme.of(context).colorScheme.secondary),
                ),
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Row(
                children: [
                  Text(
                    'THEME',
                    style: GoogleFonts.getFont('Montserrat',
                        fontSize: 24,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Icon(
                            CupertinoIcons.moon_fill,
                            color: Theme.of(context).colorScheme.secondary,
                            size: 25,
                          ),
                        ),
                        const SizedBox(
                          width: 35,
                        ),
                        Expanded(
                            child: Switch(value: false, onChanged: (value) {})),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Icon(
                            CupertinoIcons.sun_min_fill,
                            color: Theme.of(context).colorScheme.secondary,
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
