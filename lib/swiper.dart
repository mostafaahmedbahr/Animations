import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/cupertino.dart';

class SwiperScreen extends StatelessWidget {
  const SwiperScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SizedBox(
        height: MediaQuery
            .of(context)
            .size
            .height * 0.75,
        child: AppinioSwiper(
          cardCount: 10,

          cardBuilder: (BuildContext context, int index) {
            return Container(
              alignment: Alignment.center,
              color: CupertinoColors.activeBlue,
              child: const Text("5"),
            );
          },


        ),
      ),
    );
  }
}