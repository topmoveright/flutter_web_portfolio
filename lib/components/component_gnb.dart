import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/constants/constant_page.dart';
import 'package:portfolio/constants/constant_size.dart';
import 'package:portfolio/constants/constant_text_style.dart';

class ComponentGnb extends StatelessWidget {
  const ComponentGnb({Key? key, this.vertical = false}) : super(key: key);

  final bool vertical;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: ConstantSize.x4,
      runSpacing: ConstantSize.x4,
      direction: vertical ? Axis.vertical : Axis.horizontal,
      children: [
        for (var m in ConstantPage.pages)
          _navMenu(
              text: m.subject,
              onTap: () {
                // 드로워 열려있으면 닫기
                WidgetsBinding.instance?.addPostFrameCallback((_) {
                  if (Scaffold.of(context).isDrawerOpen) {
                    Scaffold.of(context).openEndDrawer();
                  }
                });
                Get.toNamed(m.route);
              },
              isCurrent: Get.currentRoute == m.route)
      ],
    );
  }

  Widget _navMenu({
    required String text,
    required VoidCallback onTap,
    required bool isCurrent,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.only(bottom: ConstantSize.x),
          decoration: BoxDecoration(
            border: Border(
              bottom: isCurrent
                  ? const BorderSide(
                      color: Colors.black,
                      width: 1,
                    )
                  : BorderSide.none,
            ),
          ),
          child: Text(
            text.toUpperCase(),
            style: ConstantTextStyle.fontSourceCodePro.copyWith(
              color: isCurrent ? Colors.black : Colors.black54,
              fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
