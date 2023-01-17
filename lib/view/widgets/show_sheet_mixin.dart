import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

mixin ShowSheetMixin {
  static Future<T?> showCustomSheet<T>(
      {required BuildContext context,
      required Widget child,
      required bool isScrollControlled}) {
    return showModalBottomSheet<T>(
      isScrollControlled: isScrollControlled,
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: context.normalRadius)),
      builder: (context) {
        return Column(
          children: [
            const _Header(),
            Expanded(child: child),
          ],
        );
      },
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(flex: 2),
        SizedBox(
            width: context.dynamicWidth(0.3),
            child: const Divider(thickness: 10)),
        const Spacer(),
        IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Icons.close))
      ],
    );
  }
}