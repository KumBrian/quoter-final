import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quoter_final/presentation/widgets/bottom_buttons.dart';
import 'package:quoter_final/presentation/widgets/my_app_bar.dart';
import 'package:quoter_final/presentation/widgets/my_drawer.dart';
import 'package:quoter_final/presentation/widgets/my_loader.dart';
import 'package:quoter_final/presentation/widgets/my_swiper.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../widgets/swiper_indicator.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final SwiperController _swiperController = SwiperController();

  void displayLikeButtonSnackBar(bool isLiked, BuildContext context) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.info(
        backgroundColor: isLiked
            ? Colors.blue.withOpacity(0.9)
            : Colors.green.withOpacity(0.9),
        textStyle: GoogleFonts.getFont('Montserrat',
            color: isLiked ? Colors.black12 : Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w100),
        message:
            isLiked ? 'You Liked a Quote By }' : 'You Disliked the Quote By ',
      ),
    );
  }

  void displaySnackBar(String text, BuildContext context) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.info(
        backgroundColor: Colors.blue.withOpacity(0.9),
        textStyle: GoogleFonts.getFont('Montserrat',
            color: Colors.orange, fontSize: 20, fontWeight: FontWeight.w700),
        message: text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: const MyAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 25,
        ),
        child: Column(
          children: [
            const LoadingRings(),
            MySwiper(
              size: size,
              swiperController: _swiperController,
            ),
            const SwiperIndicator(),
            const BottomButtons(),
          ],
        ),
      ),
    );
  }
}
