import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: GestureDetector(
            onTap: () {},
            child: Icon(
              CupertinoIcons.refresh_circled,
              color: Theme.of(context).colorScheme.secondary,
              size: 50,
            ),
          ),
        )
      ],
      backgroundColor: Theme.of(context).colorScheme.surface,
      centerTitle: true,
      toolbarHeight: 100,
      elevation: 0,
      title: Text(
        'QUOTER',
        style: GoogleFonts.getFont(
          'Montserrat',
          fontSize: 40,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      leading: Builder(builder: (context) {
        return Padding(
          padding: const EdgeInsets.only(left: 16),
          child: GestureDetector(
            onTap: () => Scaffold.of(context).openDrawer(),
            child: Icon(
              Icons.menu,
              color: Theme.of(context).colorScheme.secondary,
              size: 50,
            ),
          ),
        );
      }),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(100);
}
