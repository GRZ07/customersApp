import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../theme/customers_theme.dart';

class MyNavBarItem extends StatelessWidget {
  final String title;
  final Widget icon;
  final bool selected;

  const MyNavBarItem({
    required this.title,
    required this.icon,
    required this.selected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(top: 6),
          width: 75,
          decoration: BoxDecoration(
            color: selected
                ? const Color.fromRGBO(16, 94, 177, 0.1)
                : CustomersTheme.colors.backgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 3),
                child: icon,
              ),
              Text(
                title,
                style: CustomersTheme.textStyles.display.copyWith(
                    color: selected
                        ? CustomersTheme.colors.primaryColor
                        : Colors.grey),
              ),
              const SizedBox(
                height: 3,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        // Selected screen underline indicator
        selected // Animating the floating options with scrolling
            ? Container(
                height: 4,
                width: 75,
                decoration: BoxDecoration(
                  color: CustomersTheme.colors.primaryColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                ),
              )
                .animate()
                .slide(
                  begin: const Offset(0, 2),
                  end: const Offset(0, 0.5),
                )
                .then(delay: selected ? const Duration(days: 1) : Duration.zero)
            : Container(
                height: 4,
                width: 75,
                decoration: BoxDecoration(
                  color: CustomersTheme.colors.primaryColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                ),
              ).animate().slide(
                  begin: const Offset(0, 0.5),
                  end: const Offset(0, 2),
                ),
      ],
    );
  }
}
