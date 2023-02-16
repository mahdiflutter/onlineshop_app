import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:onlineshop/bloc/home/home_bloc.dart';
import 'package:onlineshop/bloc/home/home_event.dart';
import 'package:onlineshop/bloc/home/home_state.dart';
import 'package:onlineshop/constants/maincolor_constant.dart';
import 'package:onlineshop/data/repository/banners_repository.dart';
import 'package:onlineshop/di/di.dart';

import 'package:onlineshop/widgets/bannerslider_widget.dart';
import 'package:onlineshop/widgets/categoryitem_widget.dart';
import 'package:onlineshop/widgets/productcart_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(HomeSendRequestEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.mainBackGround,
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: CustomAppbar(),
                ),
                if (state is HomeLodingState) ...[
                  const SliverToBoxAdapter(
                    child: SpinKitRing(
                      color: MainColors.mainBlue,
                      size: 30.0,
                      lineWidth: 3,
                    ),
                  )
                ],
                if (state is HomeResponseState) ...[
                  SliverToBoxAdapter(
                    child: BannerSlider(bannerList: state.response),
                  ),
                ]
              ],
            );
          },
        ),
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  const ProductList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 44),
      child: SizedBox(
        height: 216,
        child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => const ProductCart(),
        ),
      ),
    );
  }
}

class CateGoryList extends StatelessWidget {
  const CateGoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 44),
        child: Column(
          children: [
            const SizedBox(
              width: double.infinity,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  'دسته بندی',
                  style: TextStyle(
                    fontFamily: 'SB',
                    color: MainColors.mainGray,
                    fontSize: 12,
                  ),
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.end,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => const CateGoryItem(),
              ),
            ),
          ],
        ));
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
              'جستجوی محصولات',
              style: TextStyle(
                color: MainColors.mainGray,
                fontSize: 17,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.search,
              color: Colors.black,
              size: 30,
            ),
            SizedBox(
              width: 12,
            ),
          ],
        ),
      ),
    );
  }
}
