import 'package:flutter/material.dart';
import 'package:innovation/theme/app_color.dart';

class TermsConditionWidget extends StatelessWidget {
  final bool value;
  final Function(bool? value) onChange;
  final String name;
  const TermsConditionWidget({
    super.key,
    required this.value,
    required this.onChange,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Checkbox(
            value: value,
            onChanged: onChange,
            activeColor: AppColor.grey,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            name,
            style: TextStyle(
              color: const Color(0xFF7AB0DA),
              decoration: TextDecoration.underline,
              decorationColor: Colors.blueAccent.withOpacity(0.5),
            ),
          )
        ],
      ),
    );
  }
}
