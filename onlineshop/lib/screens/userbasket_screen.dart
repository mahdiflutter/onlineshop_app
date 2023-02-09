import 'package:flutter/material.dart';
import 'package:onlineshop/constants/maincolor_constant.dart';
import 'package:flutter_dash/flutter_dash.dart';
class UserBasketScreen extends StatefulWidget {
  const UserBasketScreen({super.key});

  @override
  State<UserBasketScreen> createState() => _UserBasketScreenState();
}

class _UserBasketScreenState extends State<UserBasketScreen> {
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
              padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 44),
              sliver: SliverList(
                
               delegate: SliverChildBuilderDelegate(
                
                (context, index) {
                  
                  return const BasketItem();
                },
                childCount: 3
                
               ),
              ),
            ),
            const SliverToBoxAdapter(
              child:CompleteButton(),
            )
          ],
        ),
      ),
    );
  }
}

class CompleteButton extends StatelessWidget {
  const CompleteButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 53,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: MainColors.mainGreen,),
        onPressed: (){},
        child: const Text('ادامه فرآیند خرید',style: TextStyle(fontSize: 20,),),
      
      ),
    );
  }
}

class BasketItem extends StatelessWidget {
  const BasketItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        height: 239,
        decoration:  BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Column(
          children:[
             SizedBox(
              width: double.infinity,
              height: 180,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SizedBox(height: 10,),
                        const Text('آیفون 13 پرومکس',
                        style:TextStyle(
                          fontSize: 16,
                          fontFamily: 'SB'
                        ),
                        ),
                        const SizedBox(height: 10,),
                        const Text('گارانتی 2 ساله اپل شاپ',
                        style:TextStyle(
                          fontSize: 10,
                          fontFamily: 'SB',
                          color: MainColors.mainGray,
                        ),
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const[
                            Text('تومان',
                              style:TextStyle(
                              fontSize: 12,
                              fontFamily: 'SB',
                              color: MainColors.mainGray,),),
                            SizedBox(width: 5,),
                            Text('49,000,000',
                              style:TextStyle(
                              fontSize: 12,
                              fontFamily: 'SB',
                              color: MainColors.mainGray,),),
                            
                         
                  
                          ],
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Wrap(
                            children: const [
                             EditOption(title: '۲۵۶ گیگابایت'),
                             EditOption(title: 'سبز'),
                             EditOption(title: '۲۵۶ گیگابایت'),
                             
                            
                            
                            ],
                          ),
                        )
                  
                      ],
                    ),
                  ),SizedBox(
                    width: 120,
                    height: 104,
                    child: Image.network('https://dkstatics-public.digikala.com/digikala-products/fa5961b7d2a4efb180d686f6f69dd45381a4d3dd_1649056488.jpg?x-oss-process=image/resize,m_lfit,h_800,w_800/quality,q_90')),
                ],
              ),
            ),
            const Dash(

              direction: Axis.horizontal,
              dashColor: MainColors.mainGray,
              dashThickness: 1,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                
                children: const[
                  Text('تومان',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  ),
                  SizedBox(width: 5,),
                  Text('49,000,000',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  ),
                  
            
                ],
              ),
            )
            
            
            
          ],
        ),
      ),
    );
  }
}

class EditOption extends StatelessWidget {
  const EditOption({
    super.key,
    required this.title
  });
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5,top: 5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1,
            color: MainColors.mainGray,
            
    
          ),
        ),
        child:  Padding(
          padding:  const EdgeInsets.symmetric(horizontal: 5,vertical:3),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.edit,size: 20,color: MainColors.mainGray,),
              const SizedBox(width: 10,),
              Text(title!,
              style: const TextStyle(
                color: MainColors.mainGray,
                fontFamily: 'SM',
                fontSize: 11,
              ),
              ),],
          ),
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
              Text('سبد خرید',
              style: TextStyle(
                color: MainColors.mainBlue,
                fontSize: 17,

                
              ),
              ),
              Spacer(),
              Icon(Icons.shopping_bag_rounded,
              color: MainColors.mainBlue,
              size: 30,
              ),
              SizedBox(width: 15,),
              
            ],
          ),
      ) ,
    );
  }
}