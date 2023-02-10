import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:onlineshop/constants/maincolor_constant.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.mainBackGround,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: CustomAppbar(),
            ),
            const SliverPadding(
              padding: EdgeInsets.only(
                top: 33,
                bottom: 20,
              ),
              sliver: SliverToBoxAdapter(
                child: Text(
                  'آیفون SE 2022',
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'SB',
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 44),
              sliver: SliverToBoxAdapter(
                child: Container(
                  width: double.infinity,
                  height: 334.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 200,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Row(
                                children: const [
                                  Icon(
                                    Icons.star_rounded,
                                    color: Colors.amber,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text('4.5'),
                                ],
                              ),
                              const Spacer(),
                              Image.network(
                                'https://dkstatics-public.digikala.com/digikala-products/fa5961b7d2a4efb180d686f6f69dd45381a4d3dd_1649056488.jpg?x-oss-process=image/resize,m_lfit,h_800,w_800/quality,q_90',
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.bookmark_border_rounded,
                                size: 30,
                              ),
                              const SizedBox(
                                width: 10,
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 45, vertical: 30),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (context, index) =>
                                const ProductImageBox(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SelectColor(),
            const SelectRam(),
            //show main information
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 10),
              sliver: SliverToBoxAdapter(
                child: Container(
                  width: double.infinity,
                  height: 46,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: Colors.black),
                  ),
                  child: Row(
                    textDirection: TextDirection.rtl,
                    children: const [
                      SizedBox(
                        width: 15,
                      ),
                      Text('مشخصات فنی'),
                      Spacer(),
                      Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: MainColors.mainBlue,
                      ),
                      SizedBox(
                        width: 15,
                      )
                    ],
                  ),
                ),
              ),
            ),
            //show about product
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 10),
              sliver: SliverToBoxAdapter(
                child: Container(
                  width: double.infinity,
                  height: 46,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: Colors.black),
                  ),
                  child: Row(
                    textDirection: TextDirection.rtl,
                    children: const [
                      SizedBox(
                        width: 15,
                      ),
                      Text('توضیحات محصول'),
                      Spacer(),
                      Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: MainColors.mainBlue,
                      ),
                      SizedBox(
                        width: 15,
                      )
                    ],
                  ),
                ),
              ),
            ),
            //show comments
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 10),
              sliver: SliverToBoxAdapter(
                child: Container(
                  width: double.infinity,
                  height: 46,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: Colors.black),
                  ),
                  child: Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      const Text('نظرات خریداران'),
                      const SizedBox(
                        width: 10,
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          Positioned(
                            right: 15,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                          ),
                          Positioned(
                            right: 30,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                          ),
                          Positioned(
                            right: 45,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: MainColors.mainBlue,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Center(
                                  child: Text(
                                '+10',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                ),
                              )),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: MainColors.mainBlue,
                      ),
                      const SizedBox(
                        width: 15,
                      )
                    ],
                  ),
                ),
              ),
            ),
            //show buttons
            SliverPadding(
              padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 34,
                vertical: 20,
              ),
              sliver: SliverToBoxAdapter(
                child: Row(
                  children: const [
                    //pricing button
                    PriceButton(),
                    SizedBox(
                      width: 20,
                    ),

                    //add to basket button
                    AddToBasketButton(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AddToBasketButton extends StatelessWidget {
  const AddToBasketButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          width: 140,
          height: 63,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: MainColors.mainBlue,
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(
            15,
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10,
              sigmaY: 10,
            ),
            child: Container(
              width: 160,
              height: 53,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Center(
                child: Text(
                  'افرودن به سبد خرید',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SB',
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class PriceButton extends StatelessWidget {
  const PriceButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          width: 140,
          height: 63,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: MainColors.mainGreen,
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(
            15,
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10,
              sigmaY: 10,
            ),
            child: Container(
              width: 160,
              height: 53,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'تومان',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        '49,500,000',
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      Text(
                        '49,000,000',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: MainColors.mainRed,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                      child: Text(
                        '%۳',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'SM',
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class SelectColor extends StatelessWidget {
  const SelectColor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(right: 44, top: 10),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              'انتخاب رنگ',
              style: TextStyle(
                fontFamily: 'SM',
                fontSize: 13,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 26,
                  height: 26,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(7)),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 26,
                  height: 26,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7)),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 26,
                  height: 26,
                  decoration: BoxDecoration(
                      color: Colors.blue[900],
                      borderRadius: BorderRadius.circular(7)),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 26,
                  height: 26,
                  decoration: BoxDecoration(
                      color: Colors.green[600],
                      borderRadius: BorderRadius.circular(7)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SelectRam extends StatelessWidget {
  const SelectRam({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(right: 44, top: 10),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              'انتخاب حافظه داخلی',
              style: TextStyle(
                fontFamily: 'SM',
                fontSize: 13,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      width: 1,
                      color: MainColors.mainGray,
                    ),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 2,
                    ),
                    child: Text('512 GB'),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      width: 1,
                      color: MainColors.mainGray,
                    ),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 2,
                    ),
                    child: Text('256 GB'),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      width: 1,
                      color: MainColors.mainGray,
                    ),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 2,
                    ),
                    child: Text('128 GB'),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 44),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        height: 46.0,
        child: Row(
          children: const [
            SizedBox(
              width: 12,
            ),
            Icon(
              Icons.apple,
              color: MainColors.mainBlue,
              size: 30,
            ),
            Spacer(),
            Text(
              'آیفون',
              style: TextStyle(
                color: MainColors.mainBlue,
                fontSize: 17,
              ),
            ),
            Spacer(),
            Icon(
              Icons.chevron_right_rounded,
              color: MainColors.mainBlue,
              size: 30,
            ),
            SizedBox(
              width: 15,
            ),
          ],
        ),
      ),
    );
  }
}

class ProductImageBox extends StatelessWidget {
  const ProductImageBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: MainColors.mainGray,
          ),
          borderRadius: BorderRadius.circular(7),
        ),
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Image.network(
            'https://dkstatics-public.digikala.com/digikala-products/fa5961b7d2a4efb180d686f6f69dd45381a4d3dd_1649056488.jpg?x-oss-process=image/resize,m_lfit,h_800,w_800/quality,q_90',
          ),
        ),
      ),
    );
  }
}
