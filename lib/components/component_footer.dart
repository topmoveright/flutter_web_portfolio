import 'package:flutter/material.dart';
import 'package:portfolio/constants/constant_size.dart';
import 'package:portfolio/constants/constant_info.dart';

class ComponentFooter extends StatelessWidget {
  const ComponentFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(ConstantSize.extra),
      child: Wrap(
        children: [
          RichText(
            text: const TextSpan(
              children: [
                WidgetSpan(
                  child: Icon(
                    Icons.copyright,
                    size: ConstantSize.x2,
                  ),
                  alignment: PlaceholderAlignment.middle,
                ),
                TextSpan(
                  text: ' ${ConstantInfo.mail}. All rights reserved.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
