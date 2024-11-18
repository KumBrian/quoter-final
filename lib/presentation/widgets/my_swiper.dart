import 'package:card_swiper/card_swiper.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:quoter_final/domain/models/quote_model.dart';
import 'package:quoter_final/presentation/widgets/quote_card.dart';

class MySwiper extends StatelessWidget {
  const MySwiper({
    super.key,
    required this.size,
    required this.swiperController,
  });

  final Size size;
  final SwiperController swiperController;

  @override
  Widget build(BuildContext context) {
    List<GlobalKey<FlipCardState>> flipCardKeys = List.generate(
      10,
      (index) => GlobalKey<FlipCardState>(),
    );

    return SizedBox(
      height: size.height * 0.5,
      child: Swiper(
        controller: swiperController,
        itemCount: 10,
        onIndexChanged: (index) async {
          swiperController.index = index;
          final canVibrate = await Haptics.canVibrate();
          await Haptics.vibrate(HapticsType.light);
        },
        viewportFraction: 0.8,
        itemHeight: double.infinity,
        itemWidth: double.infinity,
        scale: 0.8,
        itemBuilder: (context, index) => QuoteCard(
          flipCardKeys: flipCardKeys,
          quote: QuoteModel(
              id: DateTime.now().millisecondsSinceEpoch,
              author: 'Me',
              quote: 'Hello World', isLiked: false),
          index: index,
        ),
      ),
    );
  }
}
