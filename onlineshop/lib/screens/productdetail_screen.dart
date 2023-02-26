import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:onlineshop/bloc/product/product_bloc.dart';
import 'package:onlineshop/bloc/product/product_event.dart';
import 'package:onlineshop/bloc/product/product_state.dart';
import 'package:onlineshop/constants/maincolor_constant.dart';
import 'package:onlineshop/data/model/product_image_model.dart';
import 'package:onlineshop/data/model/product_model.dart';
import 'package:onlineshop/data/model/property_model.dart';
import 'package:onlineshop/data/model/variant_model.dart';
import 'package:onlineshop/data/model/variant_product_model.dart';
import 'package:onlineshop/widgets/cachedimage_widget.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key, required this.product});
  final ProductModel? product;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  void initState() {
    BlocProvider.of<ProductBloc>(context).add(
        ProductGetDataEvent(widget.product!.id!, widget.product!.categoryId!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.mainBackGround,
      body: SafeArea(child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              if (state is ProductLoadingState) ...[
                const SliverToBoxAdapter(
                  child: SpinKitWave(
                    color: MainColors.mainBlue,
                    size: 50.0,
                  ),
                )
              ],
              if (state is ProductResponseState) ...[
                state.categoryProduct!.fold(
                  (categoryProductException) {
                    return CustomAppbar(
                        categoryTitle: categoryProductException);
                  },
                  (categoryProductResponse) {
                    return CustomAppbar(categoryTitle: categoryProductResponse);
                  },
                ),
                ProductTitle(title: widget.product!.name!),
                state.response!.fold(
                  (responseException) {
                    return const SliverToBoxAdapter(
                      child: Text('error'),
                    );
                  },
                  (response) => ProductGallery(
                    galleryList: response,
                    product: widget.product,
                  ),
                ),
                state.variantProductModel!.fold((variantsException) {
                  return SliverToBoxAdapter(
                    child: Text(variantsException),
                  );
                }, (variantsProductModel) {
                  return VariantGeneratorContainer(
                      variantProductsList: variantsProductModel);
                }),
                state.response!.fold((responseException) {
                  return SliverToBoxAdapter(
                    child: Text(responseException),
                  );
                }, (response) {
                  return productDescription(
                    description: widget.product!.description,
                  );
                }),
                state.propertyProduct.fold((propertyProductException) {
                  return SliverToBoxAdapter(
                    child: Text(propertyProductException),
                  );
                }, (propertyProduct) {
                  return PropertyProductContainer(
                    proprtyModel: propertyProduct,
                  );
                })
              ],

              /*const SelectRam(),
              //show main information
              
              //show about product
              SliverPadding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 44, vertical: 10),
                sliver: SliverToBoxAdapter(
                  child: Container(
                    width: double.infinity,
                    height: 46,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: Colors.black),
                    ),
                    child: Row(
                      textDirection: TextDirection.rtl,
                      children: const [
                        SizedBox(
                          width: 15,
                        ),
                        Text('توضیحات محصول'),
                        Spacer(),
                        Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: MainColors.mainBlue,
                        ),
                        SizedBox(
                          width: 15,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              //show comments
              SliverPadding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 44, vertical: 10),
                sliver: SliverToBoxAdapter(
                  child: Container(
                    width: double.infinity,
                    height: 46,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: Colors.black),
                    ),
                    child: Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        const Text('نظرات خریداران'),
                        const SizedBox(
                          width: 10,
                        ),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            Positioned(
                              right: 15,
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            ),
                            Positioned(
                              right: 30,
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            ),
                            Positioned(
                              right: 45,
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: MainColors.mainBlue,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: const Center(
                                    child: Text(
                                  '+10',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                  ),
                                )),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: MainColors.mainBlue,
                        ),
                        const SizedBox(
                          width: 15,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              //show buttons
              SliverPadding(
                padding: const EdgeInsetsDirectional.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    children: const [
                      //pricing button
                      PriceButton(),
                      SizedBox(
                        width: 20,
                      ),

                      //add to basket button
                      AddToBasketButton(),
                    ],
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

class PropertyProductContainer extends StatefulWidget {
  final List<PropertyModel>? proprtyModel;
  const PropertyProductContainer({super.key, this.proprtyModel});

  @override
  State<PropertyProductContainer> createState() =>
      _PropertyProductContainerState();
}

class _PropertyProductContainerState extends State<PropertyProductContainer> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 10),
      sliver: SliverToBoxAdapter(
          child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isVisible = !isVisible;
              });
            },
            child: Container(
              width: double.infinity,
              height: 46,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1, color: Colors.black),
              ),
              child: Row(
                textDirection: TextDirection.rtl,
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  const Text('مشخصات فنی'),
                  const Spacer(),
                  isVisible
                      ? const Icon(
                          Icons.keyboard_arrow_up_rounded,
                          color: MainColors.mainBlue,
                        )
                      : const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: MainColors.mainBlue,
                        ),
                  const SizedBox(
                    width: 15,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Visibility(
            visible: isVisible,
            child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1, color: Colors.black),
                ),
                child: Column(
                  children: getPropertyList(widget.proprtyModel!),
                )),
          ),
        ],
      )),
    );
  }

  List<Widget> getPropertyList(List<PropertyModel> properties) {
    List<Widget> items = [];
    for (var item in properties) {
      items.add(
        Padding(
          padding: const EdgeInsets.only(top: 13),
          child: Text(
            '${item.title} : ${item.value}',
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
          ),
        ),
      );
    }
    return items;
  }
}

class productDescription extends StatefulWidget {
  final String? description;
  const productDescription({super.key, this.description});

  @override
  State<productDescription> createState() => _productDescriptionState();
}

class _productDescriptionState extends State<productDescription> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 10),
      sliver: SliverToBoxAdapter(
          child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isVisible = !isVisible;
              });
            },
            child: Container(
              width: double.infinity,
              height: 46,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1, color: Colors.black),
              ),
              child: Row(
                textDirection: TextDirection.rtl,
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  const Text('توضیحات محصول'),
                  const Spacer(),
                  isVisible
                      ? const Icon(
                          Icons.keyboard_arrow_up_rounded,
                          color: MainColors.mainBlue,
                        )
                      : const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: MainColors.mainBlue,
                        ),
                  const SizedBox(
                    width: 15,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Visibility(
            visible: isVisible,
            child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1, color: Colors.black),
                ),
                child: Text(
                  widget.description!,
                  textDirection: TextDirection.rtl,
                  style: const TextStyle(
                    fontFamily: 'sm',
                    height: 1.8,
                    fontSize: 16,
                  ),
                )),
          ),
        ],
      )),
    );
  }
}

class ProductTitle extends StatelessWidget {
  final String? title;
  const ProductTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(
        top: 33,
        bottom: 20,
      ),
      sliver: SliverToBoxAdapter(
        child: Text(
          title!,
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'SB',
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class ProductGallery extends StatefulWidget {
  final List<ProductImageModel>? galleryList;
  final ProductModel? product;
  const ProductGallery(
      {super.key, required this.galleryList, required this.product});

  @override
  State<ProductGallery> createState() => _ProductGalleryState();
}

class _ProductGalleryState extends State<ProductGallery> {
  int selectedImageOfGallery = 0;
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: 44,
        vertical: 20,
      ),
      sliver: SliverToBoxAdapter(
        child: Container(
          width: double.infinity,
          height: widget.galleryList!.isNotEmpty ? 334.0 : 250.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.star_rounded,
                            color: Colors.amber,
                            size: 30,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text('4.5'),
                        ],
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: CachedImage(
                            radius: 15,
                            imageUrl: widget.galleryList!.isNotEmpty
                                ? widget.galleryList![selectedImageOfGallery]
                                    .imageUrl!
                                : widget.product!.thumbnail!),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.bookmark_border_rounded,
                        size: 30,
                      ),
                      const SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                ),
              ),
              widget.galleryList!.isNotEmpty
                  ? Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 45, vertical: 30),
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: widget.galleryList!.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedImageOfGallery = index;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Container(
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 2,
                                        color: selectedImageOfGallery == index
                                            ? MainColors.mainBlue
                                            : MainColors.mainBackGround,
                                      ),
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                    child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: CachedImage(
                                          imageUrl: widget
                                              .galleryList![index].imageUrl!,
                                          radius: 10,
                                        )),
                                  ),
                                ),
                              );
                            }),
                      ),
                    )
                  : Row(),
            ],
          ),
        ),
      ),
    );
  }
}

class AddToBasketButton extends StatelessWidget {
  const AddToBasketButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          width: 140,
          height: 63,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: MainColors.mainBlue,
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(
            15,
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10,
              sigmaY: 10,
            ),
            child: Container(
              width: 160,
              height: 53,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Center(
                child: Text(
                  'افرودن به سبد خرید',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SB',
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class PriceButton extends StatelessWidget {
  const PriceButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          width: 140,
          height: 63,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: MainColors.mainGreen,
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(
            15,
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10,
              sigmaY: 10,
            ),
            child: Container(
              width: 160,
              height: 53,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'تومان',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        '49,500,000',
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      Text(
                        '49,000,000',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: MainColors.mainRed,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                      child: Text(
                        '%۳',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'SM',
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class VariantGeneratorContainer extends StatelessWidget {
  final List<VariantProductModel>? variantProductsList;
  const VariantGeneratorContainer({super.key, this.variantProductsList});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(right: 44, bottom: 10),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            for (var variant in variantProductsList!) ...[
              if (variant.variants!.isNotEmpty) ...{
                VariantContainer(
                  variantProduct: variant,
                )
              }
            ]
          ],
        ),
      ),
    );
  }
}

class VariantContainer extends StatelessWidget {
  final VariantProductModel? variantProduct;
  const VariantContainer({super.key, this.variantProduct});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                variantProduct!.type!.title!,
                style: const TextStyle(
                  fontFamily: 'SM',
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          if (variantProduct!.type!.type! == 'Color') ...[
            VariantColorsOptions(colorsList: variantProduct!.variants),
          ],
          if (variantProduct!.type!.type! == 'Storage') ...[
            VariantStorageOptions(storagesList: variantProduct!.variants!)
          ]
        ],
      ),
    );
  }
}

class VariantColorsOptions extends StatefulWidget {
  final List<VariantModel>? colorsList;
  const VariantColorsOptions({super.key, required this.colorsList});

  @override
  State<VariantColorsOptions> createState() => _VariantColorsOptionsState();
}

class _VariantColorsOptionsState extends State<VariantColorsOptions> {
  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.colorsList!.length,
          itemBuilder: (context, index) {
            String color = 'ff${widget.colorsList![index].value!}';
            var hexColor = int.parse(color, radix: 16);
            return InkWell(
              onTap: () {
                setState(() {
                  selectedItem = index;
                });
              },
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: selectedItem == index
                      ? MainColors.mainBlue
                      : Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Container(
                  margin: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Color(hexColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class VariantStorageOptions extends StatefulWidget {
  final List<VariantModel>? storagesList;
  const VariantStorageOptions({super.key, required this.storagesList});

  @override
  State<VariantStorageOptions> createState() => _VariantStorageOptionsState();
}

class _VariantStorageOptionsState extends State<VariantStorageOptions> {
  int? selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 26,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.storagesList!.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                setState(() {
                  selectedItem = index;
                });
              },
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      width: selectedItem == index ? 2 : 1,
                      color: selectedItem == index
                          ? MainColors.mainBlue
                          : Colors.black),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 2,
                  ),
                  child: Text(widget.storagesList![index].value!),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class SelectRam extends StatelessWidget {
  const SelectRam({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(right: 44, top: 10),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              'انتخاب حافظه داخلی',
              style: TextStyle(
                fontFamily: 'SM',
                fontSize: 13,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      width: 1,
                      color: MainColors.mainGray,
                    ),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 2,
                    ),
                    child: Text('512 GB'),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      width: 1,
                      color: MainColors.mainGray,
                    ),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 2,
                    ),
                    child: Text('256 GB'),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      width: 1,
                      color: MainColors.mainGray,
                    ),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 2,
                    ),
                    child: Text('128 GB'),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key, required this.categoryTitle});
  final String? categoryTitle;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 44),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          height: 46.0,
          child: Row(
            children: [
              const SizedBox(
                width: 12,
              ),
              const Icon(
                Icons.apple,
                color: MainColors.mainBlue,
                size: 30,
              ),
              const Spacer(),
              Text(
                '$categoryTitle',
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
                width: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
