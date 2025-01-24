import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hw_tiktok_clone/constants/gaps.dart';
import 'package:hw_tiktok_clone/constants/sizes.dart';
import 'package:hw_tiktok_clone/features/authentication/widgets/form_botton.dart';
import 'package:hw_tiktok_clone/features/onboarding/category_screen.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  String _password = "";

  bool _obscureText = true;
  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _onTapObsecure() {
    _obscureText = !_obscureText;
    setState(() {
      _password = _passwordController.text;
    });
  }

  bool _isPasswordValid() {
    return _password.isNotEmpty && _password.length > 8;
  }

  void _onSubmit() {
    if (!_isPasswordValid()) return;
  }

  void _onTapNext() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const CategoryScreen(),
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
                "You'll need a password",
                style: TextStyle(
                  fontSize: Sizes.size32,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.left,
              ),
              Gaps.v24,
              Text(
                "Make sure it's 8 characters or more",
                style: TextStyle(
                  fontSize: Sizes.size20,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey.shade700,
                ),
                textAlign: TextAlign.left,
              ),
              Gaps.v32,
              TextField(
                obscureText: _obscureText,
                onEditingComplete: _onSubmit,
                //controller를 initate에서 addlister하고 _password라는 값을 set하도록해야함.
                //그렇지 않으면, TextField 에서 onChanged 라는 옵션을 살려야함.
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: const TextStyle(
                    color: Colors.black87,
                    fontSize: Sizes.size20,
                    fontWeight: FontWeight.w500,
                  ),
                  suffix: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: _onTapObsecure,
                        child: FaIcon(
                          _obscureText
                              ? FontAwesomeIcons.eye
                              : FontAwesomeIcons.eyeSlash,
                          color: Colors.black54,
                        ),
                      ),
                      Gaps.h14,
                      FaIcon(
                        FontAwesomeIcons.solidCircleCheck,
                        color: _isPasswordValid() ? Colors.green : Colors.grey,
                        size: Sizes.size28,
                      ),
                    ],
                  ),
                ),
                cursorColor: Theme.of(context).primaryColor,
              ),
              Gaps.v80,
              Gaps.v44,
              GestureDetector(
                onTap: _isPasswordValid() ? _onTapNext : null,
                child: FormButton(
                  disabled: !_isPasswordValid() ? true : false,
                  title: "Next",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
