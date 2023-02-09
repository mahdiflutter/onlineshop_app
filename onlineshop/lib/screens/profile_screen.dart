import 'package:flutter/material.dart';
import 'package:onlineshop/constants/maincolor_constant.dart';
import 'package:onlineshop/widgets/categoryitem_widget.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.mainBackGround,
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppbar(),
            const SizedBox(height: 20,),
            Wrap(
              spacing: 25,

              children: const [
                ProfileItem(),
                ProfileItem(),
                ProfileItem(),
                ProfileItem(),
                ProfileItem(),
                ProfileItem(),
                ProfileItem(),
                ProfileItem(),
                ProfileItem(),
                ProfileItem(),

              ],
            ),
            const Spacer(),
            const Text('اپل شاپ',
            style: TextStyle(
              fontFamily: 'SM',
              color: MainColors.mainGray,
              fontSize: 14,
            ),
            ),
            const Text('Version 1.0.0',
            style: TextStyle(
              fontFamily: 'SM',
              color: MainColors.mainGray,
              fontSize: 14,
            ),
            ),
            const Text('GitHub:mahdiflutter',
            style: TextStyle(
              fontFamily: 'SM',
              color: MainColors.mainGray,
              fontSize: 14,
            ),
            ),
            const SizedBox(height: 20,)

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
              Text('حساب کاربری',
              style: TextStyle(
                color: MainColors.mainBlue,
                fontSize: 17,

                
              ),
              ),
              Spacer(),
              Icon(Icons.person_pin_rounded,
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

class ProfileItem extends StatelessWidget {
  const ProfileItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                    child: Container(
                    width: 56.0,
                    height: 56,
                    
                    decoration: ShapeDecoration(
                      shadows:const [
                        BoxShadow(
                          blurRadius: 5,
                          spreadRadius: -3,
                          color: MainColors.mainRed,
                          offset: Offset(0, 8),
                        )
                      ],
                      color: MainColors.mainRed,
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      )
                    ),
                    child:const Icon(Icons.settings,color:Colors.white,size: 35,),
                    
                    ),
                  ),
                  const SizedBox(height: 10,),
                  const Text('تنظیمات',
                    style: TextStyle(
                      fontFamily: 'SB',
                      fontSize: 12,
                    ),
                  
                  ),

      ],
    );
  }
}