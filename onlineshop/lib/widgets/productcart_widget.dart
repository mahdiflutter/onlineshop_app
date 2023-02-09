import 'package:flutter/material.dart';
import 'package:onlineshop/constants/maincolor_constant.dart';
class ProductCart extends StatelessWidget {
  const ProductCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
        width: 160,
        decoration:  BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)

        ),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 124,
              child: Padding(
                
                padding: const EdgeInsets.only(top: 10),
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children:  [
                    SizedBox(
                      width: double.infinity,
                      child: Image.network('https://dkstatics-public.digikala.com/digikala-products/fa5961b7d2a4efb180d686f6f69dd45381a4d3dd_1649056488.jpg?x-oss-process=image/resize,m_lfit,h_800,w_800/quality,q_90'),
                      ),
                    const Positioned(
                      top:5,
                      right: 3,
                       child:  Icon(Icons.bookmark_border_rounded,
                       color: MainColors.mainBlue,
                       size: 35,),
                     ),
                     Positioned(
                      bottom: 5,
                      left: 3,
                       child: Container(
                        decoration:  BoxDecoration(
                          color: MainColors.mainRed,
                          borderRadius: BorderRadius.circular(8)
                          
                        ),
                        child:const Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 7,vertical: 3),
                          child: Text('%۳',style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'SM',
                            fontSize: 16,
                          ),),
                        ),
                       ),
                     )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const[
                Spacer(),
                Text('آیفون ۱۳ پرومکس',
            style: TextStyle(
              fontFamily: 'SM',
              fontSize: 14,
            ),
            ),
            SizedBox(width: 10,),
              ],
            ),
            const SizedBox(height: 5,),
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
                      const Text('تومان',
                      style: TextStyle(
                        fontFamily: 'SM',
                        fontSize: 12,
                        color: Colors.white,
                      ),
                      ),
                      
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('۴۶٬۰۰۰٬۰۰۰',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontFamily: 'SM',
                            decoration: TextDecoration.lineThrough,
                            
                          ),
                          
                          
                            ),
                          Text('۴۵٬۳۵۰٬۰۰۰',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontFamily: 'SM',
                            
                          ),
                          
                          
                            ),

                        ],
                      ),
                     
                      const Icon(Icons.chevron_right_rounded,
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
      
    );
  }
}