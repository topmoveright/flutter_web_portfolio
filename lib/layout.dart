import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/components/component_gnb.dart';
import 'package:portfolio/constants/constant_size.dart';
import 'package:portfolio/responsive.dart';
import 'package:portfolio/templates/template_desktop.dart';
import 'package:portfolio/templates/template_mobile.dart';
import 'package:portfolio/templates/template_tablet.dart';

class Layout extends StatelessWidget {
  const Layout({
    Key? key,
    required this.child,
    this.fullWidth = false,
  }) : super(key: key);

  final Widget child;
  final bool fullWidth;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return true;
      },
      child: Scaffold(
        drawerEnableOpenDragGesture: false,
        endDrawerEnableOpenDragGesture: false,
        drawer: Drawer(
          child: Column(
            children: const [
              SizedBox(height: ConstantSize.big),
              ComponentGnb(vertical: true),
            ],
          ),
        ),
        body: Scrollbar(
          child: SingleChildScrollView(
            child: Responsive(
              desktop: TemplateDesktop(
                fullWidth: fullWidth,
                child: child,
              ),
              tablet: TemplateTablet(
                fullWidth: fullWidth,
                child: child,
              ),
              mobile: TemplateMobile(
                fullWidth: fullWidth,
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
