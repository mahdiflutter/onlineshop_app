import 'package:flutter/material.dart';
import 'package:onlineshop/constants/maincolor_constant.dart';
import 'package:onlineshop/data/model/banner_model.dart';
import 'package:onlineshop/widgets/cachedimage_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerSlider extends StatelessWidget {
  List<BannerAds>? bannerList;
   BannerSlider({super.key,this.bannerList});

  @override
  Widget build(BuildContext context) {
    final controller = PageController(viewportFraction: 0.9);
    return SizedBox(
      height: 170,
      child: Stack(alignment: AlignmentDirectional.bottomCenter, children: [
        PageView.builder(
          controller: controller,
          itemCount: bannerList!.length,
          itemBuilder: (context, index) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: CachedImage(imageUrl:bannerList![index].thumbnail),
          ),
        ),
        Positioned(
          bottom: 10,
          child: SmoothPageIndicator(
            controller: controller,
            count: 3,
            effect: const ExpandingDotsEffect(
              dotHeight: 10,
              dotWidth: 10,
              expansionFactor: 5,
              activeDotColor: MainColors.mainBlue,
              dotColor: Colors.white,
            ),
          ),
        )
      ]),
    );
  }
}
