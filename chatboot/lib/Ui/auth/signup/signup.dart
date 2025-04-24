import 'package:chatboot/Ui/auth/signup/signup_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chatboot/Core/constant/color.dart';
import 'package:chatboot/Ui/auth/signin/login.dart';
import 'package:chatboot/Ui/widgets/button.dart';
import 'package:chatboot/Ui/widgets/text_field.dart';
import 'package:chatboot/Ui/screens/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Signup extends StatelessWidget {
  Signup({super.key});

  final nameC = TextEditingController();
  final mailC = TextEditingController();
  final passwordC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SignupViewModel(),
      child: Consumer<SignupViewModel>(
        builder: (context, viewModel, _) {
          return Scaffold(
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: [
                        70.verticalSpace,
                        const Text(
                          "Create Your Account",
                          style: TextStyle(fontSize: 40),
                        ),
                        const Text(
                          "Please provide the detail",
                          style: TextStyle(fontSize: 20, color: grey),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: grey.withAlpha(100),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.camera_alt_sharp, size: 40),
                        ),
                        const SizedBox(height: 30),
                        textfild(
                          labelText: "Enter Name",
                          controller: nameC,
                          keyboardType: TextInputType.name,
                        ),
                        const SizedBox(height: 30),
                        textfild(
                          labelText: "Enter Email",
                          controller: mailC,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 20),
                        textfild(
                          labelText: "Enter Password",
                          controller: passwordC,
                          keyboardType: TextInputType.visiblePassword,
                          isPassword: true,
                        ),
                        const SizedBox(height: 20),
                        button(
                          label: "Sign up",
                          onTap: () async {
                            final errorCode = await viewModel.signUp(
                              mailC.text.trim(),
                              passwordC.text.trim(),
                            );
                            if (errorCode == null) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ),
                              );
                            } else {
                              showDialog(
                                context: context,
                                builder:
                                    (_) => AlertDialog(
                                      title: const Text("Error"),
                                      content: Text(getErrorMessage(errorCode)),
                                      actions: [
                                        TextButton(
                                          onPressed:
                                              () => Navigator.pop(context),
                                          child: const Text("OK"),
                                        ),
                                      ],
                                    ),
                              );
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have an account? ",
                              style: TextStyle(fontSize: 20, color: grey),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (_) => Login()),
                                );
                              },
                              child: const Text(
                                "Sign in",
                                style: TextStyle(fontSize: 20, color: primary),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                if (viewModel.isLoading)
                  const Center(child: CircularProgressIndicator()),
              ],
            ),
          );
        },
      ),
    );
  }

  String getErrorMessage(String code) {
    switch (code) {
      case 'email-already-in-use':
        return 'This email is already registered.';
      case 'weak-password':
        return 'The password is too weak.';
      case 'invalid-email':
        return 'The email is not valid.';
      default:
        return 'An unexpected error occurred.';
    }
  }
}
