import 'dart:async'; // Import the correct Timer package
import 'package:chatboot/Core/constant/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    // Initialize the Timer to navigate to the Login screen after 3 seconds
    _timer = Timer(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, wrapper);
    });
  }
  

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            frame, // Replace with your actual frame asset path
            fit: BoxFit.fill,
            height: 1.sh,
            width: 1.sw,
          ),
          Center(
            child: Image.asset(
              logo, // Replace with your actual logo asset path
              fit: BoxFit.fill,
              height: 150.h,
              width: 150.w,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer to avoid memory leaks
    super.dispose();
  }
}