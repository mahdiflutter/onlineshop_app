import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineshop/bloc/category/caregory_state.dart';
import 'package:onlineshop/bloc/category/category_bloc.dart';
import 'package:onlineshop/bloc/category/category_event.dart';
import 'package:onlineshop/constants/maincolor_constant.dart';
import 'package:onlineshop/data/model/category_model.dart';
import 'package:onlineshop/widgets/cachedimage_widget.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<CategoryModel> _categoryList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<CategoryBloc>(context).add(
      CategoryGetEvent(),
    );
  }

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
            BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoadingState) {
                  return const SliverToBoxAdapter(
                    child: Text('Loading...'),
                  );
                }
                if (state is CategoryResponseState) {
                  
                  return CategoryList(list: state.response);
                }
                if (state is CategoryErrorState) {
                  
                  return const SliverToBoxAdapter(
                    child: Text('Network error'),
                  );
                }
                return const SliverToBoxAdapter(
                  child: Text('Uknown Error!'),
                );
              },
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
  List<CategoryModel>? list;

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
