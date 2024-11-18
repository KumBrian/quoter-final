import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:quoter_final/domain/models/quote_model.dart';
import 'package:quoter_final/presentation/widgets/quotation_mark.dart';

class QuoteCard extends StatelessWidget {
  const QuoteCard({
    super.key,
    required this.flipCardKeys,
    required this.quote,
    required this.index,
  });

  final List<GlobalKey<FlipCardState>> flipCardKeys;
  final int index;
  final QuoteModel quote;

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      key: flipCardKeys[index],
      flipOnTouch: true,
      onFlip: () async {
        final canVibrate = await Haptics.canVibrate();
        await Haptics.vibrate(HapticsType.light);
      },
      front: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.brightness != Brightness.dark
              ? Theme.of(context).colorScheme.surface
              : Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            quote.author,
            style: GoogleFonts.getFont(
              'Moon Dance',
              fontSize: 40,
              color: Theme.of(context).colorScheme.brightness != Brightness.dark
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.surface,
            ),
          ),
        ),
      ),
      back: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.brightness == Brightness.dark
              ? Theme.of(context).colorScheme.surface
              : Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Expanded(
              flex: 1,
              child: QuotationMark(
                alignment: Alignment.centerLeft,
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Center(
                  child: Text(
                    quote.quote,
                    style: GoogleFonts.getFont(
                      'Montserrat',
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.brightness !=
                              Brightness.dark
                          ? Theme.of(context).colorScheme.surface
                          : Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const Expanded(
              flex: 1,
              child: QuotationMark(
                alignment: Alignment.centerRight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
