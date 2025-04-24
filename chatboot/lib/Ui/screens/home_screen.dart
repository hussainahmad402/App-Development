import 'package:chatboot/Core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:chatboot/Core/services/auth_service.dart';
import 'package:chatboot/Core/constant/strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        centerTitle: true,
        automaticallyImplyLeading: false, // Removes the back button
      ),
      body: Center(
        child: InkWell(
          onTap: () async {
            // Call the logout method
            final authService = AuthService();
            await authService.logout();

            // Navigate back to the Login screen
            Navigator.pushReplacementNamed(context, login);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            decoration: BoxDecoration(
              color: primary, // Button background color
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              "Logout",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white, // Text color
              ),
            ),
          ),
        ),
      ),
    );
  }
}
