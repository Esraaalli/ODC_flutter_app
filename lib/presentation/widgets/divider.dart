import 'package:flutter/material.dart';

class DefaultDivider extends StatelessWidget {
  const DefaultDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          child: Divider(),
        ),
        Text("OR"),
        Expanded(
          child: Divider(),
        ),
      ],
    );
  }
}
