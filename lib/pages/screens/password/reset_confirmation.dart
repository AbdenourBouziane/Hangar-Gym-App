import 'package:flutter/material.dart';
import 'package:hangar_gym/config/assets.config.dart';
import 'package:hangar_gym/config/colors.config.dart';
import 'package:hangar_gym/pages/screens/home_page.dart';
import 'package:hangar_gym/pages/widgets/resetpassword/input_field.widget.dart';
import 'package:hangar_gym/views/appbar.dart';
import 'package:hangar_gym/views/passwordappbar.dart';

class ConfirmationPage extends StatelessWidget {
  const ConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, 
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Image.asset(Assets.images.blacklogo)],
            ),
            const SizedBox(height: 50,),
            Image.asset(Assets.images.confirmation),
            const SizedBox(height: 20,),
            Text("Your email is ", style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            Text("successfully verified ! ", style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),            FilledButton(
              onPressed: () {
                // Handle button press
              },
              style: FilledButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 255, 255, 255)),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.mainBlue, AppColors.mainRed],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: Text(
                    'Confirm',
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
