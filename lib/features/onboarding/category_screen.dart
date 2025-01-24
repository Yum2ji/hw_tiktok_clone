import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hw_tiktok_clone/constants/gaps.dart';
import 'package:hw_tiktok_clone/constants/sizes.dart';
import 'package:hw_tiktok_clone/features/authentication/widgets/form_botton.dart';
import 'package:hw_tiktok_clone/features/onboarding/Interest_screen.dart';
import 'package:hw_tiktok_clone/features/onboarding/widgets/category_button.dart';

const categories = [
  "Fashion & Beauty",
  "Outdoors",
  "Arts & Cultrue",
  "Animation & Comics",
  "Business & Finance",
  "Food",
  "Travel",
  "Entertainment",
  "Music",
  "Gaming",
  "Movies",
  "Wellbeing",
  "Science",
  "Nature"
];

List<String> _selectedCategories = [];

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  void _updateSelectedCategories(String category, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedCategories.add(category); // 카테고리 추가
      } else {
        _selectedCategories.remove(category); // 카테고리 제거
      }
    });
  }

  void _onNextTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => InterestScreen(
          interestCategories: _selectedCategories,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: FaIcon(
          FontAwesomeIcons.twitter,
          color: Theme.of(context).primaryColor,
          size: Sizes.size40,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size36,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gaps.v28,
                    const Text(
                      "What do you want to see on Twitter?",
                      style: TextStyle(
                        fontSize: Sizes.size32,
                        fontWeight: FontWeight.w800,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Gaps.v24,
                    Text(
                      "Select at least 3 interests to personalize your\nTwitter experience. They will be visible on\nyour profile",
                      style: TextStyle(
                        fontSize: Sizes.size16 + Sizes.size2,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey.shade700,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size14,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gaps.v28,
                    Wrap(
                      spacing: 7,
                      runSpacing: 7,
                      children: [
                        for (var category in categories)
                          CategoryButton(
                              category: category,
                              onSelected: (isSelected) {
                                _updateSelectedCategories(category, isSelected);
                              })
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 100,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             const Row(
               children: [
                 Text(
                  "Great Work🎉",
                  style: TextStyle(
                    fontSize: Sizes.size16 + Sizes.size2,
                    fontWeight: FontWeight.normal,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.left,
                             ),
               ],
             ),

            SizedBox(
              width: 110,
              child: GestureDetector(
                onTap: _selectedCategories.length >= 3 ? _onNextTap : null,
                child: FormButton(
                  disabled: _selectedCategories.length < 3,
                  title: "Next",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
