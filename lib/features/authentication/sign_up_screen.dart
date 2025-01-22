import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hw_tiktok_clone/constants/gaps.dart';
import 'package:hw_tiktok_clone/constants/sizes.dart';
import 'package:hw_tiktok_clone/features/authentication/create_account_screen.dart';
import 'package:hw_tiktok_clone/features/authentication/widgets/auth_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void _onCreateAccountTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CreateAccountScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size40,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                            Gaps.v10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(
                  FontAwesomeIcons.twitter,
                  color: Theme.of(context).primaryColor,
                  size: Sizes.size40,
                ),
                  ],
                ),
                Gaps.v80,
                Gaps.v40,
                const Text(
                  "See what's happening in the world right now.",
                  style: TextStyle(
                    fontSize: Sizes.size36,
                    fontWeight: FontWeight.w800,
                  ),
                  textAlign: TextAlign.justify,
                ),
                Gaps.v96,
                AuthButton(
                  icon: SizedBox(
                    height: 30,
                    child: SvgPicture.asset(
                      'assets/icons/google_icon.svg',
                      height: 30,
                      width: 30,
                    ),
                  ),
                  text: "Continue with Google",
                  mainBlack: true,
                ),
                Gaps.v16,
                const AuthButton(
                  icon: SizedBox(
                    height: 30,
                    child: FaIcon(
                      FontAwesomeIcons.apple,
                      size: 30,
                    ),
                  ),
                  text: "Continue with Apple",
                  mainBlack: true,
                ),
                Gaps.v20,
                SizedBox(
                  width: 500,
                  child: Row(
                    children: [
                      Flexible(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Divider(
                              thickness: 1,
                              color: Colors.grey.shade400,
                            ),
                          ],
                        ),
                      ),
                      Gaps.h4,
                      Text(
                        'or',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w500,
                          fontSize: Sizes.size16,
                        ),
                      ),
                      Gaps.h5,
                      Flexible(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Divider(
                              thickness: 1,
                              color: Colors.grey.shade400,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Gaps.v8,
                GestureDetector(
                  onTap : () => _onCreateAccountTap(context),
                  child: AuthButton(
                    icon: SizedBox(
                      height: 30,
                      child: Container(),
                    ),
                    text: "Create account",
                    mainBlack: false,
                  ),
                ),
                Gaps.v24,
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'By sigining up, you agree to our ',
                          style: TextStyle(
                            fontSize: Sizes.size20,
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                        ),
                        Text(
                          'Terms',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: Sizes.size20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          ',',
                          style: TextStyle(
                            fontSize: Sizes.size20,
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Privacy Policy',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: Sizes.size20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          ', and ',
                          style: TextStyle(
                            fontSize: Sizes.size20,
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                        ),
                        Text(
                          'Cookie Use.',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: Sizes.size20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar:  BottomAppBar(
        color: Colors.white,
        elevation: 2,
        child :     Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size40,),
          child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Have an acount alread?',
                        style: TextStyle(
                          fontSize: Sizes.size16 + Sizes.size2,
                          color: Theme.of(context).secondaryHeaderColor,
                        ),
                      ),
                      Gaps.h5,
                      Text(
                        'Log in',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: Sizes.size16 + Sizes.size2,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
        ),
      ),
    );
  }
}
