import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hw_tiktok_clone/constants/gaps.dart';
import 'package:hw_tiktok_clone/constants/sizes.dart';
import 'package:hw_tiktok_clone/features/authentication/customize_screen.dart';
import 'package:hw_tiktok_clone/features/authentication/widgets/form_botton.dart';
import 'package:hw_tiktok_clone/features/onboarding/interests_screen.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController _usernameConroller = TextEditingController();
  final TextEditingController _useremailConroller = TextEditingController();

  final TextEditingController _birthdayController = TextEditingController();
  final FocusNode _birthdayFocusNode = FocusNode();
  bool _showBottomAppBar = false;

  String _username = "";
  String _email = "";
  DateTime initialDate = DateTime.now();
  bool _isCheckCust = false;

  @override
  void initState() {
    super.initState();

    _usernameConroller.addListener(() {
      setState(() {
        _username = _usernameConroller.text;
      });
    });

    _useremailConroller.addListener(() {
      setState(() {
        _email = _useremailConroller.text;
      });
    });

    _birthdayFocusNode.addListener(() {
      setState(() {
        _showBottomAppBar = _birthdayFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _usernameConroller.dispose();
    _useremailConroller.dispose();
    _birthdayController.dispose();
    _birthdayFocusNode.dispose();

    //init에서는 super 먼저 init, dispose는 super.dispose가 마지막
    super.dispose();
  }

  void _setTextFieldDate(DateTime date) {
    final textDate = date.toString().split(" ").first;
    _birthdayController.value = TextEditingValue(text: textDate);
  }

  void _onCustomizeTap() {
    _isCheckCust = true;
    _showBottomAppBar = false;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CustomizeScreen(
          valSwitch: false,
        ),
      ),
    );
  }

  void _onSignUpTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const InterestsScreen(),
      ),
    );
  }

  String? _errorUserNameText;
  String? _errorEmailText;
  String? _errorBirthText;

  void _validateInput() {
    setState(() {
      if (_usernameConroller.text.isEmpty) {
        _errorUserNameText = 'UserName Text error';
      } else {
        _errorUserNameText = null;
      }
    });
  }

  void _isEmailValid() {
    setState(() {
      final reExp = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

      if (_useremailConroller.text.isEmpty) {
        _errorEmailText = 'Email cannot be empty';
      } else if (!reExp.hasMatch(_useremailConroller.text)) {
        _errorEmailText = "Not Valid";
      } else {
        _errorEmailText = null;
      }
    });
  }

  void _isBirthValid() {
    setState(() {
      if (_birthdayController.text.isEmpty) {
        _errorBirthText =
            'This will not be shown publicly. Confirm your own age, even if this account is for a business, a pet, or somthing else.';
      } else {
        _errorBirthText = null;
      }
    });
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size36,
              ),
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
                  Gaps.v40,
                  const Text(
                    "Create your account",
                    style: TextStyle(
                      fontSize: Sizes.size36,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Gaps.v36,
                  TextField(
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: Sizes.size20,
                      fontWeight: FontWeight.w400,
                    ),
                    controller: _usernameConroller,
                    decoration: InputDecoration(
                      suffix: Icon(
                        Icons.check_circle_sharp,
                        size: Sizes.size28,
                        color: _usernameConroller.text.isNotEmpty &&
                                _errorUserNameText == null
                            ? Colors.green
                            : Colors.grey.shade400,
                      ),
                      labelText: "Name", // hintText 대신 labelText 사용
                      labelStyle: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: Sizes.size20,
                        fontWeight: FontWeight.w400,
                      ),
                      //enabledBorder , focusedBorder 2개 조합을 같게해서 항상 같은 색나오게
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                          width: 2,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                          width: 2,
                        ),
                      ),
                    ),
                    cursorColor: Theme.of(context).primaryColor,
                    onChanged: (_) => _validateInput(),
                  ),
                  Gaps.v28,
                  TextField(
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: Sizes.size20,
                      fontWeight: FontWeight.w400,
                    ),
                    controller: _useremailConroller,
                    decoration: InputDecoration(
                      suffix: Icon(
                        Icons.check_circle_sharp,
                        size: Sizes.size28,
                        color: _useremailConroller.text.isNotEmpty &&
                                _errorEmailText == null
                            ? Colors.green
                            : Colors.grey.shade400,
                      ),
                      errorText: _errorEmailText,
                      labelText: _useremailConroller.text.isNotEmpty
                          ? "Email"
                          : "Phone number or email address", // hintText 대신 labelText 사용
                      labelStyle: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: Sizes.size20,
                        fontWeight: FontWeight.w400,
                      ),
                      //enabledBorder , focusedBorder 2개 조합을 같게해서 항상 같은 색나오게
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                          width: 2,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                          width: 2,
                        ),
                      ),
                    ),
                    cursorColor: Theme.of(context).primaryColor,
                    onChanged: (_) => _isEmailValid(),
                  ),
                  Gaps.v28,
                  TextField(
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: Sizes.size20,
                      fontWeight: FontWeight.w400,
                    ),
                    readOnly: true,
                    focusNode: _birthdayFocusNode,
                    controller: _birthdayController,
                    decoration: InputDecoration(
                      suffix: Icon(
                        Icons.check_circle_sharp,
                        size: Sizes.size28,
                        color: _errorBirthText == null
                            ? Colors.green
                            : Colors.grey.shade400,
                      ),
                      labelText: "Date of birth", // hintText 대신 labelText 사용
                      labelStyle: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: Sizes.size20,
                        fontWeight: FontWeight.w400,
                      ),
                      //enabledBorder , focusedBorder 2개 조합을 같게해서 항상 같은 색나오게
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                          width: 2,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                          width: 2,
                        ),
                      ),
                    ),
                    cursorColor: Theme.of(context).primaryColor,
                    onChanged: (_) => _isBirthValid(),
                  ),
                  if (_showBottomAppBar)
                    Text(
                      'This will not be shown publicly. Confirm your own age, even if this account is for a business, a pet, or somthing else.',
                      style: TextStyle(
                        fontSize: Sizes.size20,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  if (_isCheckCust)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gaps.v96,
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
                              "Terms of Service",
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
                              "and ",
                              style: TextStyle(
                                fontSize: Sizes.size16,
                                color: Theme.of(context).secondaryHeaderColor,
                              ),
                            ),
                            Text(
                              "Privacy Policy",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: Sizes.size16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              ", including ",
                              style: TextStyle(
                                fontSize: Sizes.size16,
                                color: Theme.of(context).secondaryHeaderColor,
                              ),
                            ),
                            Text(
                              "Cookie Use",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: Sizes.size16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              ". Twitter",
                              style: TextStyle(
                                fontSize: Sizes.size16,
                                color: Theme.of(context).secondaryHeaderColor,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "may use your contact information, including your",
                          style: TextStyle(
                            fontSize: Sizes.size16,
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                        ),
                        Text(
                          "email address and phone number for purposes",
                          style: TextStyle(
                            fontSize: Sizes.size16,
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                        ),
                        Text(
                          "outlined in our Privacy Policy, like keeping your",
                          style: TextStyle(
                            fontSize: Sizes.size16,
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                        ),
                        Text(
                          "account secure and Personalizing our services,",
                          style: TextStyle(
                            fontSize: Sizes.size16,
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "including ads.",
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
                            Text(
                              ". Others will be able to",
                              style: TextStyle(
                                fontSize: Sizes.size16,
                                color: Theme.of(context).secondaryHeaderColor,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "find you by email or phone number, when provided,",
                          style: TextStyle(
                            fontSize: Sizes.size16,
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "unless you choose otherwise ",
                              style: TextStyle(
                                fontSize: Sizes.size16,
                                color: Theme.of(context).secondaryHeaderColor,
                              ),
                            ),
                            Text(
                              "here",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: Sizes.size16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  Gaps.v80,
                  GestureDetector(
                      onTap: _isCheckCust ? _onSignUpTap : _onCustomizeTap,
                      child: FormButton(
                        disabled: !(_usernameConroller.text.isNotEmpty &&
                            _errorUserNameText == null &&
                            _useremailConroller.text.isNotEmpty &&
                            _errorEmailText == null &&
                            _birthdayController.text.isNotEmpty),
                        title: _isCheckCust ? "Sign up" : "Next",
                      )),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: _showBottomAppBar // 상태에 따라 BottomAppBar 표시
            ? BottomAppBar(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size5,
                  vertical: Sizes.size10,
                ),
                color: Colors.white,
                height: 200,
                child: CupertinoDatePicker(
                  itemExtent: 32,
                  maximumDate: initialDate,
                  initialDateTime: initialDate,
                  mode: CupertinoDatePickerMode.date,
                  onDateTimeChanged: _setTextFieldDate,
                ),
              )
            : null,
      ),
    );
  }
}
