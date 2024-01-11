import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hangar_gym/config/assets.config.dart';
import 'package:hangar_gym/config/colors.config.dart';
import 'package:hangar_gym/controllers/navigation_controller.dart';
import 'package:hangar_gym/utils/constant.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final NavigationController navigationController =
      Get.put(NavigationController());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;
  final formKey = GlobalKey<FormState>();

  // Future<bool> createUsers({
  //   required final String email,
  //   required final String password,
  // }) async {
  //   final response = await Supabase.instance.client.auth
  //       .signUp(email: email, password: password);

  //   if (response.isBlank == null) {
  //     return false;
  //   } else {
  //     return true;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign up Page',
          style: TextStyle(
            color: AppColors.mainBlue,
            fontFamily: 'Lato',
          ),
        ),
        elevation: 0.5,
        centerTitle: true,
        backgroundColor: AppColors.white,
        iconTheme: const IconThemeData(color: AppColors.mainBlue),
      ),
      body: Column(
        children: [
          const SizedBox(height: 70),
          Image.asset(
            Assets.images.blackLogo,
          ),
          const SizedBox(height: 30),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20.0),
                ),
              ),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please fill in email address";
                          }
                          return null;
                        },
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            color: AppColors.mainBlue.withOpacity(0.5),
                            fontFamily: 'Lato',
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: AppColors.mainBlue,
                              width: 2.0,
                            ),
                          ),
                          focusColor: AppColors.mainBlue,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please fill in password";
                          }
                          return null;
                        },
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            color: AppColors.mainBlue.withOpacity(0.5),
                            fontFamily: 'Lato',
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: AppColors.mainBlue,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: isLoading
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.mainBlue,
                              ),
                            )
                          : ElevatedButton(
                              onPressed: () async {
                                final isValide =
                                    formKey.currentState!.validate();
                                if (!isValide) {
                                  return;
                                }

                                setState(() {
                                  isLoading = true;
                                });

                                try {
                                  await client.auth.signUp(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );

                                  // ignore: use_build_context_synchronously
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        "Account created successfully. Check your email for confirmation.",
                                      ),
                                      backgroundColor: Colors.green,
                                    ),
                                  );

                                  // ignore: use_build_context_synchronously
                                  Navigator.pushReplacementNamed(
                                      context, 'loginPage');
                                } catch (error) {
                                  if (kDebugMode) {
                                    print('Error during signup: $error');
                                  }

                                  // ignore: use_build_context_synchronously
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Sign Up failed "),
                                      backgroundColor: AppColors.mainRed,
                                    ),
                                  );
                                } finally {
                                  setState(() {
                                    isLoading = false;
                                  });
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.gradientPurple,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 14),
                              ),
                              child: const Text('Sign Up'),
                            ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
