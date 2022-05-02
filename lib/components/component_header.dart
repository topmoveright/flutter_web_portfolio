import 'package:flutter/material.dart';
import 'package:portfolio/components/component_gnb.dart';

class ComponentHeader extends StatelessWidget {
  const ComponentHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        children: [
          const Expanded(
            flex: 2,
            child: FlutterLogo(),
          ),
          Expanded(
            flex: 8,
            child: ComponentGnb(),
          ),
          const Expanded(
            flex: 2,
            child: Icon(Icons.android_sharp),
          ),
        ],
      ),
    );
  }
}
