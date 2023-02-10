import 'package:flutter/material.dart';
import 'package:onlineshop/constants/maincolor_constant.dart';

class CateGoryItem extends StatelessWidget {
  const CateGoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            width: 56.0,
            height: 56,
            decoration: ShapeDecoration(
                shadows: const [
                  BoxShadow(
                    blurRadius: 5,
                    spreadRadius: -3,
                    color: MainColors.mainBlue,
                    offset: Offset(0, 8),
                  )
                ],
                color: MainColors.mainBlue,
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                )),
            child: const Icon(
              Icons.phone_android,
              color: MainColors.mainWhite,
              size: 35,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'موبایل',
          style: TextStyle(
            fontFamily: 'SB',
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
