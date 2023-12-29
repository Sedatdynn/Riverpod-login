import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final String hintText;
  final IconData icon;

  const AuthTextField(
      {super.key,
      required this.onSaved,
      required this.validator,
      required this.hintText,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      style: Theme.of(context).textTheme.titleSmall,
      cursorColor: Colors.black,
      keyboardType: TextInputType.emailAddress,
      onChanged: onSaved,
      validator: validator,
      decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.cyanAccent,
          ),
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.bodyLarge),
    );
  }
}
