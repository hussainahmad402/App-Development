import 'package:flutter/material.dart';
import 'package:chatboot/Core/constant/color.dart';

class button extends StatelessWidget {
  final String label;
  final void Function()? onTap;

  const button({
    required this.label,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, // Enable tap without loading condition
      child: Container(
        height: 70,
        width: 380,
        decoration: BoxDecoration(
          color: primary, // Always use the primary color
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        ),
      ),
    );
  }
}