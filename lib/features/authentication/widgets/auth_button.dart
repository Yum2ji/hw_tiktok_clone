import 'package:flutter/material.dart';
import 'package:hw_tiktok_clone/constants/gaps.dart';
import 'package:hw_tiktok_clone/constants/sizes.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final SizedBox icon;
  final bool mainBlack;

  const AuthButton({
    super.key,
    required this.text, 
    required this.icon,
    required this.mainBlack,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      //FractionallySizedBox relative size to parents widget
      widthFactor: 1, //1이면 fathersize
      child: Container(
         padding : const EdgeInsets.symmetric(
            horizontal: Sizes.size40,
            vertical: Sizes.size14,
          ),
        decoration: BoxDecoration(
          color : mainBlack? Colors.white: Colors.black87,
          border: Border.all(
            color :  mainBlack? Colors.grey.shade300 : Colors.black87,
            width: Sizes.size2,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Align 은 특정1개만 widget만 움직임 insde Stack
            Align(
              alignment: Alignment.centerLeft,
              child : icon,
            ),
            Gaps.h20,
            Text(text,
            style:  TextStyle(
              fontSize: Sizes.size20,
              fontWeight : FontWeight.w800,
              color : mainBlack ?  Colors.black : Colors.grey.shade300,
            ),
            textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
