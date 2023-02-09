import 'package:flutter/material.dart';
import 'package:onlineshop/constants/maincolor_constant.dart';
import 'package:onlineshop/widgets/bannerslider_widget.dart';
import 'package:onlineshop/widgets/categoryitem_widget.dart';
import 'package:onlineshop/widgets/productcart_widget.dart';
class HomeScreenn extends StatefulWidget {
  const HomeScreenn({super.key});

  @override
  State<HomeScreenn> createState() => _HomeScreennState();
}

class _HomeScreennState extends State<HomeScreenn> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: MainColors.mainBackGround,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            //app bar
             const SliverToBoxAdapter(
              child: CustomAppbar(),
            ),
            //slider
             const SliverToBoxAdapter(
              child: BannerSlider(),
            ),
            //none
            const  SliverToBoxAdapter(
              child: SizedBox(height: 20,),
            ),
            //categorys
            const SliverToBoxAdapter(
              child: CateGoryList()
            ),
            //none
           const  SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            //popular products
            SliverToBoxAdapter(
              child: SizedBox(
                height: 300,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 44),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const[
                          Icon(Icons.chevron_left_rounded,
                          color: MainColors.mainBlue,
                          size: 30,
                          ),
                          Text('مشاهده همه',
                          style: TextStyle(
                            color: MainColors.mainBlue,
                            fontSize: 12,
                          ),
                          ),
                          Spacer(),
                          Text('پر فروش ترین ها',
                          style: TextStyle(
                            color: MainColors.mainGray,
                            fontSize: 12,
                          ),
                          ),
                          
                        ],
                      ),
                    ),
                    const SizedBox(height: 10,),
                    const ProductList(),
                  ],
                )
                              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 300,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 44),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const[
                          Icon(Icons.chevron_left_rounded,
                          color: MainColors.mainBlue,
                          size: 30,
                          ),
                          Text('مشاهده همه',
                          style: TextStyle(
                            color: MainColors.mainBlue,
                            fontSize: 12,
                          ),
                          ),
                          Spacer(),
                          Text('پر بازدید ترین ها',
                          style: TextStyle(
                            color: MainColors.mainGray,
                            fontSize: 12,
                          ),
                          ),
                          
                        ],
                      ),
                    ),
                    const SizedBox(height: 10,),
                    const ProductList(),
                  ],
                )
                              ),
            ),
           
          ],
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
          const SizedBox(width: double.infinity,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children:const [
              Text('دسته بندی',
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
          const SizedBox(height: 10,),
          SizedBox(
        height: 100,
        
        child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => const CateGoryItem(),
        ),
      ),
        ],
      )
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
      padding:  const EdgeInsets.symmetric(vertical: 20,horizontal: 44),
      child:Container(
        decoration:  BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          ),
          height: 46.0,
          child: Row(
            children: const [
              SizedBox(width: 12,),
              Icon(
                Icons.apple,
                color: MainColors.mainBlue,
                size: 30,
              ),
              Spacer(),
              Text('جستجوی محصولات',
              style: TextStyle(
                color: MainColors.mainGray,
                fontSize: 17,

                
              ),
              ),
              SizedBox(width: 10,),
              Icon(
                Icons.search,
                color: Colors.black,
                size: 30,
              ),
              SizedBox(width: 12,),
            ],
          ),
      ) ,
    );
  }
}