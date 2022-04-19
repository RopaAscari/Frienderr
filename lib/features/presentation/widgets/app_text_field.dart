import 'package:flutter/material.dart';
import 'package:frienderr/core/services/services.dart';

class AppTextField extends StatefulWidget {
  final String label;
  final bool isObscure;
  final String? errorText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry padding;
  final TextEditingController controller;

  const AppTextField({
    Key? key,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    required this.label,
    required this.isObscure,
    required this.controller,
    this.padding = const EdgeInsets.only(),
  }) : super(key: key);

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool canPasswordShow = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: widget.padding,
        child: TextField(
          controller: widget.controller,
          decoration: new InputDecoration(
            filled: true,
            labelText: widget.label,
            errorText: widget.errorText,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.isObscure ? passswordIcon() : widget.suffixIcon,
            labelStyle: TextStyle(color: Colors.grey, fontSize: 13.5),
            enabledBorder: OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.grey[800]!),
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedBorder: OutlineInputBorder(
              // borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(8.0),
            ),
            border: new OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.grey[600]!),
              borderRadius: BorderRadius.circular(8.0),
            ),
            fillColor: HexColor('#9C9C9C').withOpacity(0.1),
            contentPadding: const EdgeInsets.only(top: 40.0),
            errorStyle: TextStyle(height: 0.7, color: Colors.red),
          ),
          obscureText: widget.isObscure ? canPasswordShow : widget.isObscure,
        ));
  }

  Widget passswordIcon() {
    return !canPasswordShow
        ? IconButton(
            color: Colors.grey,
            onPressed: () => setState(() => canPasswordShow = !canPasswordShow),
            icon: const Icon(
              Icons.visibility_off,
              size: 21.5,
            ))
        : IconButton(
            color: Colors.grey,
            onPressed: () => setState(() => canPasswordShow = !canPasswordShow),
            icon: const Icon(
              Icons.visibility,
              size: 21.5,
            ));
  }
}
