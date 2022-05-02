import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/constants/constant_size.dart';
import 'package:portfolio/controllers/controller_layout.dart';

class Responsive extends GetView<ControllerLayout> {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // 드로워 열려있으면 닫기
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          if (Scaffold.of(context).isDrawerOpen) {
            Scaffold.of(context).openEndDrawer();
          }
        });

        var maxWidth = constraints.maxWidth;
        if (maxWidth >= ConstantSize.desktopWidth) {
          return desktop;
        } else if (maxWidth >= ConstantSize.tabletWidth) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}
