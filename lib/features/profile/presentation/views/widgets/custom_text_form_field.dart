import 'package:flutter/material.dart';
import 'package:flutter_final_graduation_project/core/utils/colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: BaseColors.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: BaseColors.grey,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: BaseColors.grey,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: BaseColors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
