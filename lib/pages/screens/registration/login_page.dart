import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hangar_gym/config/assets.config.dart';
import 'package:hangar_gym/config/colors.config.dart';
import 'package:hangar_gym/controllers/navigation_controller.dart';
import 'package:hangar_gym/utils/constant.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final NavigationController navigationController =
      Get.put(NavigationController());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<String?> userLogin({
    required final String email,
    required final String password,
  }) async {
    final response = await Supabase.instance.client.auth.signInWithPassword(
      email: email,
      password: password,
    );
    final user = response.user;
    return user?.id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login Page',
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
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
              ),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                    ),
                    const SizedBox(height: 16),
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
                            return "Please fill in password field";
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
                    const SizedBox(height: 16),
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
                                if (isValide != true) {
                                  return;
                                }
                                setState(() {
                                  isLoading = true;
                                });
                                try {
                                  final dynamic loginValue = await userLogin(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                  setState(() {
                                    isLoading = false;
                                  });

                                  if (loginValue != null) {
                                    // ignore: use_build_context_synchronously
                                    Navigator.pushReplacementNamed(
                                        context, '/homePage');
                                  } else {
                                    // ignore: use_build_context_synchronously
                                    context.showErrorMessage(
                                        "Invalid email or password");
                                  }
                                } catch (error) {
                                  if (kDebugMode) {
                                    print('Error during login: $error');
                                  }
                                  setState(() {
                                    isLoading = false;
                                  });
                                  // ignore: use_build_context_synchronously
                                  context
                                      .showErrorMessage("Error during login");
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.gradientPurple,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                              ),
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 18,
                                ),
                              ),
                            ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "You are new here ?",
                          style: TextStyle(
                            color: AppColors.blueGradient.withOpacity(0.6),
                            fontFamily: 'Lato',
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            navigationController.naviagteToSignUpPage();
                          },
                          child: const Text(
                            "Create an account",
                            style: TextStyle(
                              color: AppColors.mainBlue,
                              fontFamily: 'Lato',
                            ),
                          ),
                        ),
                      ],
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
