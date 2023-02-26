import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:onlineshop/bloc/productbycategory/productbycategory_bloc.dart';
import 'package:onlineshop/bloc/productbycategory/productbycategory_event.dart';
import 'package:onlineshop/bloc/productbycategory/productbycategory_state.dart';
import 'package:onlineshop/constants/maincolor_constant.dart';
import 'package:onlineshop/widgets/productcart_widget.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen(
      {super.key, required this.categoryId, this.categoryTitle});
  final String? categoryId;
  final String? categoryTitle;

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    BlocProvider.of<ProductByCategoryBloc>(context).add(
      ProductByCategoryGetProductsEvent(widget.categoryId!),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.mainBackGround,
      body: SafeArea(
          child: BlocBuilder<ProductByCategoryBloc, ProductByCategoryState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              if (state is ProductByCategoryInitState) ...[
                const SliverToBoxAdapter(
                  child: Text('data'),
                )
              ],
              if (state is ProductByCategoryLoadingState) ...[
                const SliverToBoxAdapter(
                  child: SpinKitRing(
                    color: MainColors.mainBlue,
                    size: 30.0,
                    lineWidth: 3,
                  ),
                )
              ],
              if (state is ProductByCategoryResponseState) ...[
                SliverToBoxAdapter(
                  child: CustomAppbar(title: widget.categoryTitle),
                ),
                state.response!.fold((productsException) {
                  return SliverToBoxAdapter(
                    child: Text(productsException),
                  );
                }, (productsResponse) {
                  return SliverPadding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 44,
                      vertical: 20,
                    ),
                    sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => ProductCart(
                          product: productsResponse[index],
                        ),
                        childCount: productsResponse.length,
                      ),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        childAspectRatio: 2 / 2.8,
                        crossAxisSpacing: 15,
                      ),
                    ),
                  );
                })
              ],
              /*//app bar-------
              const SliverToBoxAdapter(
                child: CustomAppbar(),
              ),
              //none---------
              const SliverToBoxAdapter(
                child: SizedBox(height: 20),
              ),
              //products list--------
              SliverPadding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 44, vertical: 20),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => const Text('data'),
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    childAspectRatio: 2 / 2.8,
                  ),
                ),
              )*/
            ],
          );
        },
      )),
    );
  }
}

class CustomAppbar extends StatelessWidget {
  final String? title;
  const CustomAppbar({super.key, required this.title});

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
          children:  [
            const SizedBox(
              width: 12,
            ),
            const Icon(
              Icons.filter_list_alt,
              color: MainColors.mainBlue,
              size: 30,
            ),
            const Spacer(),
            Text(
              title!,
              style: const TextStyle(
                color: MainColors.mainBlue,
                fontSize: 17,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.chevron_right_rounded,
              color: MainColors.mainBlue,
              size: 30,
            ),
            const SizedBox(
              width: 12,
            ),
          ],
        ),
      ),
    );
  }
}
