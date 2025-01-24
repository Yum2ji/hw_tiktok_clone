import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hw_tiktok_clone/constants/sizes.dart';

class CategoryButton extends StatefulWidget {
  final String category;
  final ValueChanged<bool> onSelected;

  const CategoryButton({super.key, required this.category, required this.onSelected});

  @override
  State<CategoryButton> createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton> {
  bool _isSelected = false;
  void _onTap() {
    setState(() {
      _isSelected = !_isSelected;
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
        height: 100,
        width: 200,
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size8,
          horizontal: Sizes.size10,
        ),
        decoration: BoxDecoration(
          color: _isSelected ? Theme.of(context).primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _isSelected
                ? Theme.of(context).primaryColor
                : Colors.grey.shade400,
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 55,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _isSelected
                      ? const FaIcon(
                          FontAwesomeIcons.solidCircleCheck,
                          color: Colors.white,
                        )
                      : Container(),
                ],
              ),
            ),
            Text(
              widget.category,
              style: TextStyle(
                color: _isSelected ? Colors.white : Colors.black87,
                fontSize: Sizes.size16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
