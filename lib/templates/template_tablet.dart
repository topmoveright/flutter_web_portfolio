import 'package:flutter/material.dart';
import 'package:portfolio/components/component_footer.dart';
import 'package:portfolio/components/component_header.dart';
import 'package:portfolio/constants/constant_size.dart';

class TemplateTablet extends StatelessWidget {
  const TemplateTablet({
    Key? key,
    required this.child,
    required this.fullWidth,
  }) : super(key: key);

  final Widget child;
  final bool fullWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ComponentHeader(),
        Container(
          padding: fullWidth
              ? const EdgeInsets.all(0)
              : const EdgeInsets.symmetric(horizontal: ConstantSize.x2),
          width: fullWidth ? double.infinity : ConstantSize.desktopWidth,
          child: child,
        ),
        const ComponentFooter(),
      ],
    );
  }
}
