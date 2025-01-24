import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hw_tiktok_clone/constants/sizes.dart';

class InterestButton extends StatefulWidget {
   String interest ;
    final ValueChanged<bool> onSelected;
   InterestButton({super.key, required this.interest, required this.onSelected});

  @override
  State<InterestButton> createState() => _InterestButtonState();
}

class _InterestButtonState extends State<InterestButton> {
    bool _isSelected = false;
 

  void _onTap(){
    setState(() {
      _isSelected =!_isSelected;
    });
    widget.onSelected(_isSelected); 

  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 300,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size8,
          horizontal: Sizes.size10,
        ),
        decoration: BoxDecoration(
          color: _isSelected ? Theme.of(context).primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: _isSelected
                ? Theme.of(context).primaryColor
                : Colors.grey.shade300,
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.interest,
              style: TextStyle(
                color: _isSelected ? Colors.white : Colors.black87,
                fontSize: Sizes.size20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}