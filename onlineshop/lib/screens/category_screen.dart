import 'package:flutter/material.dart';
import 'package:onlineshop/constants/maincolor_constant.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
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
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 20),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: MainColors.mainRed,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    );
                  },
                  childCount: 10,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
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
              Icons.apple,
              color: MainColors.mainBlue,
              size: 30,
            ),
            Spacer(),
            Text(
              'دسته بندی',
              style: TextStyle(
                color: MainColors.mainBlue,
                fontSize: 17,
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
