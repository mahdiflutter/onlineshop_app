import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineshop/bloc/product/product_bloc.dart';
import 'package:onlineshop/constants/maincolor_constant.dart';
import 'package:onlineshop/data/model/product_model.dart';
import 'package:onlineshop/screens/productdetail_screen.dart';
import 'package:onlineshop/widgets/cachedimage_widget.dart';

class ProductCart extends StatelessWidget {
  final ProductModel? product;
  const ProductCart({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => ProductBloc(),
              child: ProductDetailScreen(product: product!,),
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 0),
        child: Container(
          width: 160,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 124,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      SizedBox(
                        width: 98,
                        height: 98,
                        child: CachedImage(imageUrl: product!.thumbnail!),
                      ),
                      const Positioned(
                        top: 5,
                        right: 3,
                        child: Icon(
                          Icons.bookmark_border_rounded,
                          color: MainColors.mainBlue,
                          size: 35,
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        left: 3,
                        child: Container(
                          decoration: BoxDecoration(
                              color: MainColors.mainRed,
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 1),
                            child: Text(
                              '${product!.present!.round().toString()} %',
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'SM',
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Wrap(
                children: [
                  Text(
                    '${product!.name}',
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontFamily: 'SM',
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    color: MainColors.mainBlue,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'تومان',
                        style: TextStyle(
                          fontFamily: 'SM',
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            product!.price!.toString(),
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontFamily: 'SM',
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          Text(
                            product!.realPrice!.toString(),
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: 'SM',
                            ),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.chevron_right_rounded,
                        color: Colors.white,
                        size: 25,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
