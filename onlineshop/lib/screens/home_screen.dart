import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:onlineshop/bloc/home/home_bloc.dart';
import 'package:onlineshop/bloc/home/home_event.dart';
import 'package:onlineshop/bloc/home/home_state.dart';
import 'package:onlineshop/constants/maincolor_constant.dart';
import 'package:onlineshop/data/model/category_model.dart';
import 'package:onlineshop/data/model/product_model.dart';
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
                  state.responseBanners.fold(
                    (l) {
                      return SliverToBoxAdapter(
                        child: Text(l),
                      );
                    },
                    (r) {
                      return SliverToBoxAdapter(
                        child: BannerSlider(bannerList: r),
                      );
                    },
                  ),
                  state.responseCategory.fold(
                    (l) {
                      return SliverToBoxAdapter(
                        child: Text(l),
                      );
                    },
                    (r) {
                      return SliverToBoxAdapter(
                        child: CateGoryList(categoryList: r),
                      );
                    },
                  ),
                  state.responseBestSellersProducts.fold(
                    (l) {
                      return SliverToBoxAdapter(
                        child: Text(l),
                      );
                    },
                    (r) {
                      print(r.length);
                      return BestSalerProductList(
                        bestSalerProducts: r,
                      );
                    },
                  ),
                  state.responseHotestProducts.fold(
                    (l) {
                      return SliverToBoxAdapter(
                        child: Text(l),
                      );
                    },
                    (r) {
                      print(r.length);
                      return HotProductList(
                        hotProducts: r,
                      );
                    },
                  ),
                ],
                

              ],
            );
          },
        ),
      ),
    );
  }
}

class BestSalerProductList extends StatelessWidget {
  List<ProductModel>? bestSalerProducts;
  BestSalerProductList({super.key, required this.bestSalerProducts});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 300,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 44),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'پر فروش ترین ها',
                    style: TextStyle(
                      color: MainColors.mainGray,
                      fontSize: 12,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'مشاهده همه',
                    style: TextStyle(
                      color: MainColors.mainBlue,
                      fontSize: 12,
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: MainColors.mainBlue,
                    size: 30,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 44),
              child: SizedBox(
                height: 216,
                child: ListView.builder(
                  itemCount: bestSalerProducts!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      ProductCart(product: bestSalerProducts![index]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
class HotProductList extends StatelessWidget {
  List<ProductModel>? hotProducts;
  HotProductList({super.key, required this.hotProducts});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 300,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 44),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'پر بازدید ترین ها',
                    style: TextStyle(
                      color: MainColors.mainGray,
                      fontSize: 12,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'مشاهده همه',
                    style: TextStyle(
                      color: MainColors.mainBlue,
                      fontSize: 12,
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: MainColors.mainBlue,
                    size: 30,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 44),
              child: SizedBox(
                height: 216,
                child: ListView.builder(
                  itemCount: hotProducts!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      ProductCart(product: hotProducts![index]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CateGoryList extends StatelessWidget {
  CateGoryList({
    super.key,
    this.categoryList,
  });
  List<CategoryModel>? categoryList;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 44),
        child: Column(
          children: [
            const SizedBox(
              width: double.infinity,
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'دسته بندی',
                  style: TextStyle(
                    fontFamily: 'SB',
                    color: MainColors.mainGray,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                itemCount: categoryList!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => CateGoryItem(
                  category: categoryList![index],
                ),
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
              Icons.search,
              color: Colors.black,
              size: 30,
            ),
            Text(
              'جستجوی محصولات',
              style: TextStyle(
                color: MainColors.mainGray,
                fontSize: 17,
              ),
            ),
            Spacer(),
            Icon(
              Icons.apple,
              color: MainColors.mainBlue,
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
