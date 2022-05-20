import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:referal/style/colors.dart';

class DefaultTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelTextStrr;
  final Color borderColor;
  final FocusNode focusNode;
  final String hintText;
  final int maxLine;
  final double borderRadiuss;
  final Function validator;
  final List<TextInputFormatter> inputFormatters;
  final TextInputType type;
  final bool isValidate;
  final bool enabled;
  final String helperText;
  final Function onPress;
  DefaultTextField(
      {@required this.controller,
      this.labelTextStrr,
      this.borderColor = primaryColor,
      this.hintText,
      this.maxLine = 1,
      this.type = TextInputType.text,
      this.enabled = true,
      this.borderRadiuss = 16.0,
      this.validator,
      this.inputFormatters,
      this.helperText,
      this.isValidate = true,
      this.focusNode,
      this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          height: 50,
          child: TextFormField(
            focusNode: focusNode,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: type,
            controller: controller,
            enabled: enabled,
            maxLines: maxLine,
            textInputAction: TextInputAction.newline,
            validator: isValidate
                ? validator != null
                    ? validator
                    : (text) {
                        if (text.isEmpty) {
                          FocusScope.of(context).requestFocus(focusNode);
                          return "Please enter a valid ${labelTextStrr ?? hintText}";
                        }
                        return null;
                      }
                : null,
            inputFormatters: inputFormatters,
            style: TextStyle(fontSize: 18, color: borderColor),
            onFieldSubmitted: (v) {
              FocusScope.of(context).nextFocus();
            },
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor, width: 1.5),
                  borderRadius: BorderRadius.circular(borderRadiuss),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor, width: 1.5),
                  borderRadius: BorderRadius.circular(borderRadiuss),
                ),
                border: OutlineInputBorder(),
                labelStyle: TextStyle(
                  fontSize: 16,
                ),
                labelText: labelTextStrr,
                hintStyle: TextStyle(fontSize: 16, color: Colors.grey.shade100),
                helperStyle: TextStyle(fontSize: 12, color: Colors.black),
                helperText: helperText,
                hintText: hintText),
          ),
        ),
      ),
    );
  }
}
