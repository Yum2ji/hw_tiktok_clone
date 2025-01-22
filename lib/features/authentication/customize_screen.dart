import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hw_tiktok_clone/constants/gaps.dart';
import 'package:hw_tiktok_clone/constants/sizes.dart';
import 'package:hw_tiktok_clone/features/authentication/widgets/form_botton.dart';

class CustomizeScreen extends StatefulWidget {
  bool valSwitch;

  CustomizeScreen({super.key, required this.valSwitch});

  @override
  State<CustomizeScreen> createState() => _CustomizeScreenState();
}

class _CustomizeScreenState extends State<CustomizeScreen> {
  void _onNextTap() {
    Navigator.of(context).pop();
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gaps.v10,
                                  Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Gaps.v10,
                            Text(
                              'Cancel',
                              style: TextStyle(
                                fontSize: Sizes.size20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
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
                    ],
                  ),
 
                Gaps.v80,
                Gaps.v40,
                const Text(
                  "Customize your expereince",
                  style: TextStyle(
                    fontSize: Sizes.size36,
                    fontWeight: FontWeight.w800,
                  ),
                  textAlign: TextAlign.left,
                ),
                Gaps.v40,
                const Text(
                  "Track where you see Twitter content across the web",
                  style: TextStyle(
                    fontSize: Sizes.size28,
                    fontWeight: FontWeight.w800,
                  ),
                  textAlign: TextAlign.left,
                ),
                Gaps.v20,
                Row(
                  children: [
                    const Flexible(
                      flex: 6,
                      child: Text(
                        "Twitter uses this data to personalize your experience. This web browsing history will never be stored with your name, email, or phone number.",
                        style: TextStyle(
                          fontSize: Sizes.size16 + Sizes.size3,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Gaps.h10,
                    Flexible(
                      flex: 1,
                      child: Switch(
                        activeColor: Colors.white,
                        activeTrackColor: Colors.green.shade400,
                        value: widget.valSwitch,
                        onChanged: (value) {
                          setState(() {
                            widget.valSwitch = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Gaps.v52,
                Row(
                  children: [
                    Text(
                      "By sigining up, you agree to our ",
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        color: Theme.of(context).secondaryHeaderColor,
                      ),
                    ),
                    Text(
                      "Terms",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: Sizes.size16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      ", ",
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        color: Theme.of(context).secondaryHeaderColor,
                      ),
                    ),
                    Text(
                      "Privacy",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: Sizes.size16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Plicy",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: Sizes.size16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      ", and",
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        color: Theme.of(context).secondaryHeaderColor,
                      ),
                    ),
                    Text(
                      " Cookie Use",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: Sizes.size16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      ". twitter may use your",
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        color: Theme.of(context).secondaryHeaderColor,
                      ),
                    ),
                  ],
                ),
                Text(
                  "contact information, including your email address",
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                ),
                Text(
                  "and phone number for purposes outlined in our",
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Privacy Policy. ",
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        color: Theme.of(context).secondaryHeaderColor,
                      ),
                    ),
                    Text(
                      "Learn more",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: Sizes.size16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Gaps.v80,
                GestureDetector(
                    onTap: () => _onNextTap(),
                    child:
                        FormButton(disabled: !widget.valSwitch, title: "Next")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
