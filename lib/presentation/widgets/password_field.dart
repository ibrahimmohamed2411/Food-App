import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final String hint;
  FormFieldValidator<String>? validator;
  TextEditingController? controller;
  PasswordField({
    Key? key,
    required this.hint,
    this.validator,
    this.controller,
  }) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isTextVisible = true;
  void changeTextVisibility(bool isVisible) {
    setState(() {
      isTextVisible = isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      obscureText: isTextVisible,
      decoration: InputDecoration(
        hintText: widget.hint,
        suffixIcon: IconButton(
          onPressed: () {
            changeTextVisibility(!isTextVisible);
          },
          icon: isTextVisible
              ? const Icon(Icons.visibility_off)
              : const Icon(Icons.visibility),
        ),
      ),
    );
  }
}
