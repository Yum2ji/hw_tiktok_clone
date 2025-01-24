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
  final TextEditingController _birthdayController = TextEditingController();
  final FocusNode _birthdayFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  bool _showBottomAppBar = false;
  bool _isEmailFocus = false;

  DateTime initialDate = DateTime.now();
  bool _isCheckCust = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map<String, String> formData = {};
  bool _isEmailValid = false;
  bool _isUserNameValid = false;
  bool _isBirthdayValid = false;
  bool _isEmailTap = true;

  void _onSubmitTap() {
    if (_formKey.currentState != null) {
      _formKey.currentState!.validate();
    }

    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
      }
    }
  }

  void _onEmailTap() {
    setState(() {
      _isEmailTap = !_isEmailTap;
    });
  }

  @override
  void initState() {
    super.initState();

    _birthdayFocusNode.addListener(() {
      setState(() {
        _showBottomAppBar = _birthdayFocusNode.hasFocus;
      });
    });
    _emailFocusNode.addListener(() {
      setState(() {
        _isEmailFocus = _emailFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _birthdayController.dispose();
    _birthdayFocusNode.dispose();

    //init에서는 super 먼저 init, dispose는 super.dispose가 마지막
    super.dispose();
  }

  void _setTextFieldDate(DateTime date) {
    _isBirthdayValid = true;
    final textDate = date.toString().split(" ").first;
    _birthdayController.value = TextEditingValue(text: textDate);
    setState(() {});
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

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  bool _isFormValid() {
    return _isEmailValid && _isUserNameValid && _isBirthdayValid;
  }

  void _checkEmailPhone(value) {
    final reExp = _isEmailTap
        ? RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        : RegExp(r"^(?:\d{2,3}-\d{3,4}-\d{4}|\d{10,11})$");
    setState(() {
      _isEmailValid = reExp.hasMatch(value);
    });
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
              child: Form(
                key: _formKey,
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
                    TextFormField(
                      decoration: InputDecoration(
                        suffix: Icon(
                          Icons.check_circle_sharp,
                          size: Sizes.size28,
                          color: _isUserNameValid
                              ? Colors.green
                              : Colors.grey.shade400,
                        ),
                        labelText: "Name",
                        labelStyle: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: Sizes.size20,
                          fontWeight: FontWeight.w400,
                        ),
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
                      onChanged: (value) {
                        setState(() {
                          _isUserNameValid = value.isNotEmpty;
                        });
                      },
                      validator: (_) => null,
                      onSaved: (newValue) {
                        if (newValue != null) {
                          formData['username'] = newValue;
                        }
                      },
                      cursorColor: Theme.of(context).primaryColor,
                    ),
                    Gaps.v28,
                    TextFormField(
                      decoration: InputDecoration(
                        suffix: Icon(
                          Icons.check_circle_sharp,
                          size: Sizes.size28,
                          color: _isEmailValid
                              ? Colors.green
                              : Colors.grey.shade400,
                        ),
                        labelText: _isEmailFocus
                            ? (_isEmailTap ? "Email" : "Phone number")
                            : "Phone number or email address",
                        labelStyle: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: Sizes.size20,
                          fontWeight: FontWeight.w400,
                        ),
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
                      focusNode: _emailFocusNode,
                      onChanged: _checkEmailPhone,
                      validator: (_) => null,
                      onSaved: (newValue) {
                        if (newValue != null) {
                          formData['email'] = newValue;
                        }
                      },
                      cursorColor: Theme.of(context).primaryColor,
                    ),
                    Gaps.v28,
                    TextFormField(
                      controller: _birthdayController,
                      decoration: InputDecoration(
                        suffix: Icon(
                          Icons.check_circle_sharp,
                          size: Sizes.size28,
                          color: _isBirthdayValid
                              ? Colors.green
                              : Colors.grey.shade400,
                        ),
                        labelText: "Date of birth",
                        labelStyle: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: Sizes.size20,
                          fontWeight: FontWeight.w400,
                        ),
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
                      readOnly: true,
                      focusNode: _birthdayFocusNode,
                      onChanged: (value) {
                        setState(() {
                          _isBirthdayValid = value.isNotEmpty;
                        });
                      },
                      validator: (_) => null,
                      onSaved: (newValue) {
                        if (newValue != null) {
                          formData['birth'] = newValue;
                        }
                      },
                      cursorColor: Theme.of(context).primaryColor,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (_isEmailFocus)
                          Flexible(
                            flex: 3,
                            child: TextButton(
                              onPressed: _onEmailTap,
                              child: Text(
                                _isEmailTap
                                    ? 'Use Phone instead'
                                    : 'Use Email instead',
                                style: TextStyle(
                                  fontSize: Sizes.size20,
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        Flexible(
                          flex: 1,
                          child: GestureDetector(
                            onTap: (_isFormValid())
                                ? (_isCheckCust
                                    ? _onSignUpTap
                                    : _onCustomizeTap)
                                : null,
                            child: FormButton(
                              disabled: !_isFormValid(),
                              title: _isCheckCust ? "Sign up" : "Next",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: _showBottomAppBar
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
