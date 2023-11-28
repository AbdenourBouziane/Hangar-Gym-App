import 'package:flutter/material.dart';
import 'package:hangar_gym/config/assets.config.dart';
import 'package:hangar_gym/config/colors.config.dart';
import 'package:hangar_gym/pages/screens/home_page.dart';
import 'package:hangar_gym/pages/widgets/resetpassword/input_field.widget.dart';
import 'package:hangar_gym/views/appbar.dart';
import 'package:hangar_gym/views/passwordappbar.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Image.asset(Assets.images.blacklogo)],
            ),
            const SizedBox(
              height: 200,
            ),
            const Text(
              "Reset your password",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Please enter a new password that is different from the old one.",
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            const SizedBox(
              height: 40,
            ),
            const InputFieldContainer(textLabel: "New password"),
            const SizedBox(
              height: 30,
            ),
            const InputFieldContainer(textLabel: "Confirm password"),
            const SizedBox( height: 20,),
            FilledButton(
              onPressed: () {
                // Handle button press
              },
              style: FilledButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 255, 255, 255)

              ),
              child: Container(
                width: double.infinity,
             
                decoration: BoxDecoration(
                  
                  gradient: LinearGradient(
                    colors: [AppColors.mainBlue,AppColors.mainRed],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: Text(
                    'Reset Password',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
