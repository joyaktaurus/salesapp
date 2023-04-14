import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../my_theme.dart';

class MATextFormField extends StatelessWidget {
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  final String hintText;
  final bool isFilled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final FormFieldValidator? validatorFn;
  final ValueChanged<String>? onchanged;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? textInputFormatter;
  final BorderSide borderside;
  final bool readOnly;
  // final ImageProvider<Object> image;
  const MATextFormField({
    Key? key,
    required this.textEditingController,
    required this.focusNode,
    required this.hintText,
    this.textInputAction = TextInputAction.next,
    this.isFilled = true,
    this.validatorFn,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.textInputFormatter = const [],
    this.borderside = const BorderSide(), //BorderSide.none,
    this.onchanged,
    this.readOnly = false,
    //required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      child: TextFormField(
        controller: textEditingController,
        focusNode: focusNode,
        decoration: textBoxDecoration(),
        textInputAction: textInputAction,
        validator: validatorFn,
        onChanged: onchanged,
        keyboardType: keyboardType,
        inputFormatters: textInputFormatter,
        readOnly: readOnly,
      ),
    );
  }

  InputDecoration textBoxDecoration() {
    return InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintStyle: MyTheme.regularTextStyle(fontSize: 16, color: Colors.grey),
        fillColor: const Color(0XFFF5F5F5), //Colors.grey.shade100,
        filled: true,
        border: OutlineInputBorder(
          borderSide: borderside,
          borderRadius: BorderRadius.circular(5),
        ),
        disabledBorder: InputBorder.none,
        contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 20));
  }


  OutlineInputBorder myinputborder() {
    //return type is OutlineInputBorder
    return OutlineInputBorder(
      //Outline border type for TextFeild
        borderRadius: BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(
          color: Colors.white60,
          style: BorderStyle.none,
          width: 1,
        ));
  }

  OutlineInputBorder myfocusborder() {
    return OutlineInputBorder(
      //Outline border type for TextFeild
        borderRadius: BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(
          color: Colors.blue.shade50,
          width: 1,
        ));
  }
}
