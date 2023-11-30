import 'package:flutter/material.dart';
import 'package:hangar_gym/config/colors.config.dart';
import 'package:hangar_gym/pages/screens/signup_page.dart';
import 'package:hangar_gym/pages/widgets/login&signup/text_field_decoration.wifget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            title: const Text(
              'Login',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: AppTextFieldDecoration(
              textLabel: "Email",
              iconLabel: Icon(Icons.email),
            ),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: AppTextFieldDecoration(
              textLabel: "Password",
              iconLabel: Icon(Icons.password),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.gradientPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: const Text('Login'),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "You are new here?",
                style: TextStyle(
                  color: AppColors.mainGrey,
                ),
              ),
              GestureDetector(
                onTap: () => _showDrawer(context, 'Sign Up'),
                child: const Text(
                  "Create an account",
                  style: TextStyle(
                    color: AppColors.mainBlue,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  void _showDrawer(BuildContext context, String title) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return title == 'Login' ? const LoginPage() : const SignupPage();
      },
    ).whenComplete(() {});
  }
}
