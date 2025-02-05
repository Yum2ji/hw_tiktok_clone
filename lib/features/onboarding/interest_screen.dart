import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hw_tiktok_clone/constants/gaps.dart';
import 'package:hw_tiktok_clone/constants/sizes.dart';
import 'package:hw_tiktok_clone/features/authentication/widgets/form_botton.dart';
import 'package:hw_tiktok_clone/features/onboarding/widgets/interest_button.dart';

const musicInterests = [];

const Map<String, List<String>> interests = {
  "Fashion & Beauty": [
    "Cosmetics",
    "Shopping",
    "Beaty",
    "Clothes",
    "Bargain",
    "Vogue",
    "Chanel",
    "Prada",
    "Cosmetics",
    "Shopping",
    "Beaty",
    "Clothes",
    "Bargain",
    "Vogue",
    "Chanel",
    "Prada",
    "Cosmetics",
    "Shopping",
    "Beaty",
    "Clothes",
    "Bargain",
    "Vogue",
    "Chanel",
    "Prada"
  ],
  "Outdoors": [
    "Surfing",
    "Dogs and Cats",
    "Climbing",
    "Swimming",
    "Riding",
    "Surfing",
    "Dogs and Cats",
    "Climbing",
    "Camping",
    "Tracking",
    "Surping",
    "Swimming",
    "Riding",
    "Surfing",
    "Dogs and Cats",
    "Climbing",
    "Swimming",
    "Riding",
    "Surfing",
    "Dogs and Cats",
    "Climbing",
    "Swimming",
    "Riding",
    "Surfing",
    "Camping",
    "Tracking",
    "Surping",
    "Dogs and Cats",
    "Climbing",
    "Swimming",
    "Riding",
    "Camping",
    "Tracking",
    "Surping",
  ],
  "Arts & Cultrue": [
    "Camping",
    "Tracking",
    "Surping",
    "Cycling",
    "Travel Agencies",
    "Climbing",
    "Walking",
    "Swimming",
    "Camping",
    "Tracking",
    "Surping",
    "Cycling",
    "Travel Agencies",
    "Climbing",
    "Walking",
    "Swimming",
    "Camping",
    "Tracking",
    "Surping",
    "Cycling",
    "Travel Agencies",
    "Climbing",
    "Walking",
    "Swimming"
  ],
  "Animation & Comics": [
    "Disney",
    "Little Pricess",
    "Simpsons",
    "Onepiece",
    "Sincchnag",
    "ABCABC",
    "DAEDAE",
    "Disney",
    "Little Pricess",
    "Simpsons",
    "Onepiece",
    "Sincchnag",
    "ABCABC",
    "DAEDAE",
    "Disney",
    "Little Pricess",
    "Simpsons",
    "Onepiece",
    "Sincchnag",
    "ABCABC",
    "DAEDAE"
  ],
  "Business & Finance": [
    "Coin",
    "Credit",
    "Loan",
    "Stocks",
    "Deposit",
    "Company",
    "BitCoin",
    "Dollar",
    "Wons",
    "Coin",
    "Credit",
    "Loan",
    "Stocks",
    "Deposit",
    "Company",
    "BitCoin",
    "Dollar",
    "Wons",
    "Coin",
    "Credit",
    "Loan",
    "Stocks",
    "Deposit",
    "Company",
    "BitCoin",
    "Dollar",
    "Wons"
  ],
  "Food": [
    "Chicken",
    "Pizza",
    "Sushi",
    "Ramen",
    "Soup",
    "Chips",
    "Uber eats",
    "Delivery services",
    "Chicken",
    "Pizza",
    "Sushi",
    "Ramen",
    "Soup",
    "Chips",
    "Uber eats",
    "Delivery services",
    "Chicken",
    "Pizza",
    "Sushi",
    "Ramen",
    "Soup",
    "Chips",
    "Uber eats",
    "Delivery services"
  ],
  "Travel": [
    "Korea",
    "Seoul",
    "Asia Tour",
    "Europe",
    "Travel Agencies",
    "Airbnb",
    "Skyscanners",
    "Airlines",
    "Korea",
    "Seoul",
    "Asia Tour",
    "Europe",
    "Travel Agencies",
    "Airbnb",
    "Skyscanners",
    "Airlines",
    "Korea",
    "Seoul",
    "Asia Tour",
    "Europe",
    "Travel Agencies",
    "Airbnb",
    "Skyscanners",
    "Airlines"
  ],
  "Entertainment": [
    "Anime",
    "Movies & TV",
    "Harry Potter",
    "Marvel Universe",
    "Movie news",
    "Naruto",
    "Movies",
    "Grammy Awards",
    "Entertainment",
    "Anime",
    "Movies & TV",
    "Harry Potter",
    "Marvel Universe",
    "Movie news",
    "Naruto",
    "Movies",
    "Grammy Awards",
    "Entertainment",
    "Anime",
    "Movies & TV",
    "Harry Potter",
    "Marvel Universe",
    "Movie news",
    "Naruto",
    "Movies",
    "Grammy Awards",
    "Entertainment"
  ],
  "Music": [
    "Rap",
    "R & B & Soul",
    "Grammy Awards",
    "Pop",
    "K-pop",
    "Music industry",
    "EDM",
    "Music news",
    "Hip hop",
    "Reggae",
    "J-pop",
    "Rap",
    "R & B & Soul",
    "Grammy Awards",
    "Pop",
    "K-pop",
    "Music industry",
    "EDM",
    "Music news",
    "Hip hop",
    "Reggae",
    "J-pop",
    "Rap",
    "R & B & Soul",
    "Grammy Awards",
    "Pop",
    "K-pop",
    "Music industry",
    "EDM",
    "Music news",
    "Hip hop",
    "Reggae",
    "J-pop"
  ],
  "Gaming": [
    "Sudoku",
    "LOL",
    "Maple stories",
    "Crazy acade",
    "Cartrider",
    "mobile game",
    "Nexon",
    "Sudoku",
    "LOL",
    "Maple stories",
    "Crazy acade",
    "Cartrider",
    "mobile game",
    "Nexon",
    "Sudoku",
    "LOL",
    "Maple stories",
    "Crazy acade",
    "Cartrider",
    "mobile game",
    "Nexon",
    "Sudoku",
    "LOL",
    "Maple stories",
    "Crazy acade",
    "Cartrider",
    "mobile game",
    "Nexon",
    "Sudoku",
    "LOL",
    "Maple stories",
    "Crazy acade",
    "Cartrider",
    "mobile game",
    "Nexon"
  ],
  "Movies": [
    "Abot time",
    "CoCO",
    "Harry Potter",
    "Frozen",
    "Lala land",
    "Disney",
    "Netflix",
    "CGV",
    "MEGABOX",
    "Abot time",
    "CoCO",
    "Harry Potter",
    "Frozen",
    "Lala land",
    "Disney",
    "Netflix",
    "CGV",
    "MEGABOX",
    "Abot time",
    "CoCO",
    "Harry Potter",
    "Frozen",
    "Lala land",
    "Disney",
    "Netflix",
    "CGV",
    "MEGABOX",
    "Abot time",
    "CoCO",
    "Harry Potter",
    "Frozen",
    "Lala land",
    "Disney",
    "Netflix",
    "CGV",
    "MEGABOX",
    "Abot time",
    "CoCO",
    "Harry Potter",
    "Frozen",
    "Lala land",
    "Disney",
    "Netflix",
    "CGV",
    "MEGABOX"
  ],
  "Wellbeing": [
    "F45",
    "Pilates",
    "Yoga",
    "Meditation",
    "Walking",
    "Sugar free",
    "Vegeterian",
    "Running",
    "F45",
    "Pilates",
    "Yoga",
    "Meditation",
    "Walking",
    "Sugar free",
    "Vegeterian",
    "Running",
    "F45",
    "Pilates",
    "Yoga",
    "Meditation",
    "Walking",
    "Sugar free",
    "Vegeterian",
    "Running",
    "F45",
    "Pilates",
    "Yoga",
    "Meditation",
    "Walking",
    "Sugar free",
    "Vegeterian",
    "Running",
    "F45",
    "Pilates",
    "Yoga",
    "Meditation",
    "Walking",
    "Sugar free",
    "Vegeterian",
    "Running"
  ],
  "Science": [
    "AI",
    "Computer science",
    "Data Analytics",
    "Checmical Engineering",
    "Chemistry",
    "Mechamics",
    "AI",
    "Computer science",
    "Data Analytics",
    "Checmical Engineering",
    "Chemistry",
    "Mechamics",
    "AI",
    "Computer science",
    "Data Analytics",
    "Checmical Engineering",
    "Chemistry",
    "Mechamics",
    "AI",
    "Computer science",
    "Data Analytics",
    "Checmical Engineering",
    "Chemistry",
    "Mechamics",
    "AI",
    "Computer science",
    "Data Analytics",
    "Checmical Engineering",
    "Chemistry",
    "Mechamics",
    "AI",
    "Computer science",
    "Data Analytics",
    "Checmical Engineering",
    "Chemistry",
    "Mechamics",
    "AI",
    "Computer science",
    "Data Analytics",
    "Checmical Engineering",
    "Chemistry",
    "Mechamics"
  ],
  "Nature": [
    "Antartic",
    "National Geographic",
    "Nepal",
    "Swiss",
    "Egypt",
    "Southern america",
    "Antartic",
    "National Geographic",
    "Nepal",
    "Swiss",
    "Egypt",
    "Southern america",
    "Antartic",
    "National Geographic",
    "Nepal",
    "Swiss",
    "Egypt",
    "Southern america",
    "Antartic",
    "National Geographic",
    "Nepal",
    "Swiss",
    "Egypt",
    "Southern america",
    "Antartic",
    "National Geographic",
    "Nepal",
    "Swiss",
    "Egypt",
    "Southern america",
    "Animal",
    "Antartic",
    "National Geographic",
    "Nepal",
    "Swiss",
    "Egypt",
    "Southern america"
  ],
};

List<String> _selectedInterests = [];

class InterestScreen extends StatefulWidget {
  final List<String> interestCategories;
  const InterestScreen({super.key, required this.interestCategories});

  @override
  State<InterestScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  void _updateSelectedInterestCategories(String category, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedInterests.add(category); // 카테고리 추가
      } else {
        _selectedInterests.remove(category); // 카테고리 제거
      }
    });
  }

  void _onNextTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const Scaffold(),
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
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size7,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
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
                        "Interests are used to personalize your\nexperience and will be visible on your profile.",
                        style: TextStyle(
                          fontSize: Sizes.size16,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey.shade700,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
                Gaps.v10,
                for (var inCategory in widget.interestCategories) ...[
                  Divider(
                    color: Colors.grey.shade300,
                  ),
                  Gaps.v20,
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.size16,
                    ),
                    child: Text(
                      inCategory,
                      style: const TextStyle(
                        fontSize: Sizes.size24,
                        fontWeight: FontWeight.w800,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Gaps.v24,
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.size20,
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        children: [
                          Wrap(
                            spacing: 5,
                            runSpacing: 7,
                            clipBehavior: Clip.hardEdge,
                            children: [
                              for (int i = 0;
                                  i < interests[inCategory]!.length;
                                  i++) ...[
                                if (i % 3 == 0)
                                  InterestButton(
                                    interest: interests[inCategory]![i],
                                    onSelected: (isSelected) {
                                      _updateSelectedInterestCategories(
                                          interests[inCategory]![i],
                                          isSelected);
                                    },
                                  ),
                              ]
                            ],
                          ),
                          Gaps.v5,
                          Wrap(
                            spacing: 5,
                            runSpacing: 7,
                            clipBehavior: Clip.hardEdge,
                            children: [
                              for (int i = 0;
                                  i < interests[inCategory]!.length;
                                  i++) ...[
                                if (i % 3 == 1)
                                  InterestButton(
                                    interest: interests[inCategory]![i],
                                    onSelected: (isSelected) {
                                      _updateSelectedInterestCategories(
                                          interests[inCategory]![i],
                                          isSelected);
                                    },
                                  ),
                              ]
                            ],
                          ),
                          Gaps.v5,
                          Wrap(
                            spacing: 5,
                            runSpacing: 7,
                            clipBehavior: Clip.hardEdge,
                            children: [
                              for (int i = 0;
                                  i < interests[inCategory]!.length;
                                  i++) ...[
                                if (i % 3 == 2)
                                  InterestButton(
                                    interest: interests[inCategory]![i],
                                    onSelected: (isSelected) {
                                      _updateSelectedInterestCategories(
                                          interests[inCategory]![i],
                                          isSelected);
                                    },
                                  ),
                              ]
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Gaps.v20,
                ]
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 100,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Divider(
              thickness: 0.2,
              color: Colors.grey.shade600,
            ),
            Gaps.v10,
            SizedBox(
              width: 110,
              child: GestureDetector(
                onTap: _selectedInterests.length >= 3 ? _onNextTap : null,
                child: FormButton(
                  disabled: _selectedInterests.length < 3,
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
