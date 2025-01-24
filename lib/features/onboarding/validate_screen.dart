import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hw_tiktok_clone/constants/gaps.dart';
import 'package:hw_tiktok_clone/constants/sizes.dart';
import 'package:hw_tiktok_clone/features/authentication/widgets/form_botton.dart';
import 'package:hw_tiktok_clone/features/onboarding/password_screen.dart';

class ValidateScreen extends StatefulWidget {
  final String email;
  const ValidateScreen({super.key, required this.email});

  @override
  State<ValidateScreen> createState() => _ValidateScreenState();
}

class _ValidateScreenState extends State<ValidateScreen> {
  void _onTapNext() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const PasswordScreen(),
        ), (route) {
      //predicate, 여기는 previous route 쓸지 안쓸지를 정하는 부분임.
      return true; //개발하는동안 true -> 추후 false로바꾸기
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: FaIcon(
          FontAwesomeIcons.twitter,
          color: Theme.of(context).primaryColor,
          size: Sizes.size40,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size36,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v28,
              const Text(
                "We sent you a code",
                style: TextStyle(
                  fontSize: Sizes.size32,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.left,
              ),
              Gaps.v24,
              const Text(
                "Enter it below to verify",
                style: TextStyle(
                  fontSize: Sizes.size20,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.left,
              ),
              Text(
                widget.email,
                style: const TextStyle(
                  fontSize: Sizes.size20,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.left,
              ),
              Gaps.v40,
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '1',
                    style: TextStyle(
                      fontSize: Sizes.size44,
                    ),
                  ),
                  Gaps.h24,
                  Text(
                    '2',
                    style: TextStyle(
                      fontSize: Sizes.size44,
                    ),
                  ),
                  Gaps.h24,
                  Text(
                    '3',
                    style: TextStyle(
                      fontSize: Sizes.size44,
                    ),
                  ),
                  Gaps.h24,
                  Text(
                    '4',
                    style: TextStyle(
                      fontSize: Sizes.size44,
                    ),
                  ),
                  Gaps.h24,
                  Text(
                    '5',
                    style: TextStyle(
                      fontSize: Sizes.size44,
                    ),
                  ),
                  Gaps.h24,
                  Text(
                    '6',
                    style: TextStyle(
                      fontSize: Sizes.size44,
                    ),
                  ),
                ],
              ),
              Gaps.v40,
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 180,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                "Didn't receive email?",
                style: TextStyle(
                  fontSize: Sizes.size20,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Gaps.v10,
            GestureDetector(
              onTap: _onTapNext,
              child: const FormButton(
                disabled: false,
                title: "Next",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
