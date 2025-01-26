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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<bool> passValid = [false, false, false, false, false, false];

  void _onTapNext() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const PasswordScreen(),
        ), (route) {
      //predicate, 여기는 previous route 쓸지 안쓸지를 정하는 부분임.
      return false; //개발하는동안 true -> 추후 false로바꾸기
    });
  }

  bool _isFormValid() {
    for (var val in passValid) if (!val) return false;

    return true;
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: Sizes.size32,
                        fontWeight: FontWeight.w600,
                      ),
                      cursorWidth: 0,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                            width: 2,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade900,
                            width: 2,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Insert num';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          passValid[0] = !passValid[0];
                        });
                      },
                    ),
                  ),
                  Gaps.h12,
                  Expanded(
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: Sizes.size32,
                        fontWeight: FontWeight.w600,
                      ),
                      cursorWidth: 0,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                            width: 2,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade900,
                            width: 2,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Insert num';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          passValid[1] = !passValid[1];
                        });
                      },
                    ),
                  ),
                  Gaps.h12,
                  Expanded(
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: Sizes.size32,
                        fontWeight: FontWeight.w600,
                      ),
                      cursorWidth: 0,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                            width: 2,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade900,
                            width: 2,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Insert num';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          passValid[2] = !passValid[2];
                        });
                      },
                    ),
                  ),
                  Gaps.h12,
                  Expanded(
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: Sizes.size32,
                        fontWeight: FontWeight.w600,
                      ),
                      cursorWidth: 0,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                            width: 2,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade900,
                            width: 2,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Insert num';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          passValid[3] = !passValid[3];
                        });
                      },
                    ),
                  ),
                  Gaps.h12,
                  Expanded(
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: Sizes.size32,
                        fontWeight: FontWeight.w600,
                      ),
                      cursorWidth: 0,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                            width: 2,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade900,
                            width: 2,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Insert num';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          passValid[4] = !passValid[4];
                        });
                      },
                    ),
                  ),
                  Gaps.h12,
                  Expanded(
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: Sizes.size32,
                        fontWeight: FontWeight.w600,
                      ),
                      cursorWidth: 0,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                            width: 2,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade900,
                            width: 2,
                          ),
                        ),
                      ),
                      validator: (_) => null,
                      onChanged: (value) {
                        setState(() {
                          passValid[5] = !passValid[5];
                        });
                      },
                    ),
                  ),
                ],
              ),
              Gaps.v28,
              if (_isFormValid()) const Center(
                  child: FaIcon(
                    FontAwesomeIcons.solidCircleCheck,
                    size: Sizes.size28,
                    color: Colors.green,
                  ),
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
              onTap: _isFormValid() ? _onTapNext : null,
              child: FormButton(
                disabled: !_isFormValid(),
                title: "Next",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
