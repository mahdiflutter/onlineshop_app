import 'package:flutter/material.dart';
import 'package:onlineshop/constants/maincolor_constant.dart';
import 'package:onlineshop/widgets/productcart_widget.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.mainBackGround,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            //app bar-------
            const SliverToBoxAdapter(
              child: CustomAppbar(),
            ),
            //none---------
            const SliverToBoxAdapter(
              child: SizedBox(height: 20),
            ),
            //products list--------
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 20),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) =>const Text('data'),
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  childAspectRatio: 2 / 2.8,
                ),
              ),
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
              Icons.filter_list_alt,
              color: MainColors.mainBlue,
              size: 30,
            ),
            Spacer(),
            Text(
              'پرفروش ترین ها',
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
              width: 12,
            ),
          ],
        ),
      ),
    );
  }
}
