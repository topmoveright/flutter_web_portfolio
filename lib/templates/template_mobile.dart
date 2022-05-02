import 'package:flutter/material.dart';
import 'package:portfolio/components/component_footer.dart';
import 'package:portfolio/components/component_header_mobile.dart';
import 'package:portfolio/constants/constant_size.dart';

class TemplateMobile extends StatelessWidget {
  const TemplateMobile({
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
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: ConstantSize.x2),
          child: ComponentHeaderMobile(),
        ),
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
