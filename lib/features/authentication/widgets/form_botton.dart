import 'package:flutter/material.dart';
import 'package:hw_tiktok_clone/constants/sizes.dart';

class FormButton extends StatelessWidget {
  const FormButton({
    super.key,
    required this.disabled,
    required this.title,
  });
  final bool disabled;
  final String title;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      
      widthFactor: 1,
      //Container 대신 쓰는.. decoration color 관련련
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: disabled
              ? Colors.grey.shade500
              : title =="Sign up"? Theme.of(context).primaryColor: Colors.grey.shade900,
        ),
        //AnimatedConainer 는 child 에 aimation주지는 않음
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 300),
          style: TextStyle(
            color: disabled ? Colors.grey.shade300 :Colors.white,
            fontWeight: FontWeight.w600,
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
