import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget formTextField({
    required String hintText,
    required String labelText,
    required FormFieldValidator validator,
    required TextEditingController controller,
    required bool obsecureText,
    Function(String)? onChanged,
    TextInputType? type,
  })
  {
    return TextFormField(
      keyboardType: type,
      onChanged: onChanged,
      obscureText: obsecureText,
      controller: controller,
      validator: validator,
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      cursorColor: Colors.green.shade700,
      style: TextStyle( fontSize: 18),
      cursorHeight: 24,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      decoration: InputDecoration(
        // suffixIcon: ,
        focusedErrorBorder: UnderlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        enabled: true,
        filled: true,
        fillColor: Colors.green.withOpacity(0.2),
        hintText: hintText,
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.green.shade700),
        contentPadding: EdgeInsets.all(22),
        // hintStyle: TextStyle(color: Colors.white70),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), ),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), ),
      ),
    );
  }