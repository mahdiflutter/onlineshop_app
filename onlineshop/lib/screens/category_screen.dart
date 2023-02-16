import 'package:flutter/material.dart';
import 'package:onlineshop/constants/maincolor_constant.dart';
import 'package:onlineshop/data/model/category_model.dart';
import 'package:onlineshop/data/repository/category_repository.dart';
import 'package:onlineshop/di/di.dart';
import 'package:onlineshop/widgets/cachedimage_widget.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Category> _categoryList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.mainBackGround,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: ElevatedButton(
                onPressed: () async {
                  final ICategoryRepository _repository = locator.get();
                  var response = await _repository.getCategory();
                  response.fold(
                    (l) {
                      print(l);
                    },
                    (r) {
                      setState(() {
                        _categoryList = r;
                      });
                      print(_categoryList);
                    },
                  );
                },
                child: const Text('get category'),
              ),
            ),
            const SliverToBoxAdapter(
              child: CustomAppbar(),
            ),
            CategoryList(
              list: _categoryList,
            )
          ],
        ),
      ),
    );
  }
}

class CategoryList extends StatelessWidget {
  CategoryList({
    super.key,
    required this.list,
  });
  List<Category>? list;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 20),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return CachedImage(imageUrl: list![index].thumbnail);
          },
          childCount: list!.length,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
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
