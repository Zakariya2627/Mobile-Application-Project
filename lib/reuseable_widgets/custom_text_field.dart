import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final bool isPassword;
  final double? width;
  final String hint;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final TextInputAction? textInputAction;
  final VoidCallback? onTapPassword;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  const CustomTextField({
    super.key,
    required this.isPassword,
    required this.hint,
    required this.controller,
    this.width,
    this.focusNode,
    this.nextFocusNode,
    this.textInputAction,
    this.onTapPassword,
    this.onTap,
    this.validator,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F3F9),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        textInputAction: textInputAction,
        keyboardType: keyboardType ?? TextInputType.text,
        obscureText: isPassword,
        validator: validator,
        onTap: onTap,
        onFieldSubmitted: (value) {
          if (nextFocusNode != null) {
            nextFocusNode!.requestFocus();
          }
        },
        style: const TextStyle(
          color: Color(0xFF1C2439),
          fontSize: 14,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
          height: 1.07,
          letterSpacing: 0.30,
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            color: const Color(0xFF1C2439).withOpacity(0.6),
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            height: 1.07,
            letterSpacing: 0.30,
          ),
          border: InputBorder.none,
          isDense: true,
          contentPadding: EdgeInsets.zero,
          suffixIcon:
              isPassword
                  ? GestureDetector(
                    onTap: onTapPassword,
                    child: const Icon(Icons.visibility, size: 20),
                  )
                  : null,
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
        ),
      ),
    );
  }
}
