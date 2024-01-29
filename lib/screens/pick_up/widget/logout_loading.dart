import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:innovation/theme/app_color.dart';

class LogoutLoading extends StatelessWidget {
  const LogoutLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 200,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CupertinoActivityIndicator(color: AppColor.primaryColor),
              ]),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text("Logout"),
              onPressed: () {},
            )
          ],
        ),
      ],
    );
  }
}
