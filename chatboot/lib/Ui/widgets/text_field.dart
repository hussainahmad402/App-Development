import 'package:flutter/material.dart';
import 'package:chatboot/Core/constant/color.dart';

class textfild extends StatefulWidget {
  final String labelText; // Added a parameter for label text
  final TextEditingController?   controller;
  final TextInputType? keyboardType;
  final bool isPassword; // New parameter to indicate if the field is a password

  const textfild({
    super.key,
    required this.labelText, // Marked as required
    required this.controller,
    required this.keyboardType,
    this.isPassword = false, // Default is not a password field
  });

  @override
  State<textfild> createState() => _textfildState();
}

class _textfildState extends State<textfild> {
  bool _obscureText = true; // State to toggle password visibility

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 380,
      child: TextField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: widget.isPassword ? _obscureText : false, // Obscure text if it's a password field
        decoration: InputDecoration(
          labelText: widget.labelText, // Use the dynamic label text
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: grey.withAlpha(50),
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText; // Toggle visibility
                    });
                  },
                )
              : null, // No suffix icon for non-password fields
        ),
      ),
    );
  }
}