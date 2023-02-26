import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineshop/bloc/productbycategory/productbycategory_bloc.dart';
import 'package:onlineshop/data/model/category_model.dart';
import 'package:onlineshop/screens/products_screen.dart';
import 'package:onlineshop/widgets/cachedimage_widget.dart';

class CateGoryItem extends StatelessWidget {
  const CateGoryItem({super.key, required this.category});
  final CategoryModel? category;

  @override
  Widget build(BuildContext context) {
    String categoryColor = 'ff${category!.color}';
    int hexColor = int.parse(categoryColor, radix: 16);
    return InkWell(
      onTap:(){
        Navigator.push(context,MaterialPageRoute(builder:(context) => BlocProvider(
          create: (context) => ProductByCategoryBloc(),
          child: ProductsScreen(categoryId: category!.id!,categoryTitle: category!.title!),
        ),));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: ShapeDecoration(
                    shadows: [
                      BoxShadow(
                        blurRadius: 5,
                        spreadRadius: -3,
                        color: Color(hexColor),
                        offset: const Offset(0, 8),
                      )
                    ],
                    color: Color(hexColor),
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ),
                SizedBox(
                  width: 25,
                  height: 25,
                  child: CachedImage(
                    imageUrl: category!.icon,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '${category!.title}',
              style: const TextStyle(
                fontFamily: 'SB',
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
