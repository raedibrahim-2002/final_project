import 'package:flutter/material.dart';
import 'package:flutter_final_graduation_project/core/utils/colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({required this.controller, super.key});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: TextFormField(
        controller: controller,
        style: TextStyle(color: Colors.black), // لون النص
        validator: (input) {
          if (controller.text.isEmpty) {
            return "Please enter email!";
          } else {
            return null;
          }
        },
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15), // حواف دائرية
            borderSide: const BorderSide(
              color: BaseColors.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15), // حواف دائرية
            borderSide: const BorderSide(
              color: BaseColors.grey,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15), // حواف دائرية
            borderSide: const BorderSide(
              color: BaseColors.grey,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15), // حواف دائرية
            borderSide: const BorderSide(
              color: BaseColors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
