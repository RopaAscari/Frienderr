import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frienderr/core/services/responsive_text.dart';
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
  bool _isTextEmpty = true;
  bool _canPasswordShow = true;

  @override
  void initState() {
    widget.controller.addListener(() {
      setState(() {
        _isTextEmpty = !widget.controller.text.isNotEmpty;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: widget.padding,
        child: TextField(
          style: const TextStyle(fontSize: 12),
          controller: widget.controller,
          decoration: InputDecoration(
            filled: true,
            isDense: false,
            labelText: widget.label,
            errorText: widget.errorText,
            prefixIcon: widget.prefixIcon,
            suffixIcon:
                widget.isObscure ? _buildPassswordIcon() : widget.suffixIcon,
            labelStyle: const TextStyle(color: Colors.grey, fontSize: 12.5),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[800]!.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(30.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.amber[800]!.withOpacity(0.5)),
              borderRadius: BorderRadius.circular(30.0),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[800]!.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(30.0),
            ),
            fillColor: Theme.of(context).inputDecorationTheme.fillColor,
            errorStyle:
                const TextStyle(height: 0.0, color: Colors.red, fontSize: 13),
          ),
          obscureText: widget.isObscure ? _canPasswordShow : widget.isObscure,
        ));
  }

  Widget _buildPassswordIcon() {
    if (_isTextEmpty) {
      return const Text('');
    }
    return !_canPasswordShow
        ? IconButton(
            onPressed: () {
              setState(() {
                _canPasswordShow = !_canPasswordShow;
              });
            },
            color: Colors.grey,
            icon: const Icon(
              CupertinoIcons.eye_slash,
              size: 21.5,
            ))
        : IconButton(
            onPressed: () {
              setState(() {
                _canPasswordShow = !_canPasswordShow;
              });
            },
            color: Colors.grey,
            icon: const Icon(
              CupertinoIcons.eye,
              size: 21.5,
            ));
  }
}
