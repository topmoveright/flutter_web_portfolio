import 'package:flutter/material.dart';
import 'package:portfolio/constants/constant_size.dart';
import 'package:portfolio/constants/constant_text_style.dart';
import 'package:portfolio/layout.dart';

class PageMain extends StatelessWidget {
  const PageMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
      fullWidth: true,
      child: Container(
        padding: const EdgeInsets.only(left: ConstantSize.extra),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bg-main.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black, BlendMode.color),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 250),
            Row(
              children: [
                Flexible(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Flutter Portfolio',
                        style: ConstantTextStyle.fontPressStart2P.copyWith(
                          color: Colors.white,
                          fontSize: ConstantSize.big,
                        ),
                      ),
                      const SizedBox(height: ConstantSize.x4),
                      Text(
                        'Project & Cloned',
                        style: ConstantTextStyle.fontPressStart2P.copyWith(
                          color: Colors.white,
                          fontSize: ConstantSize.big,
                        ),
                      ),
                      const SizedBox(height: ConstantSize.extra),
                      const Text(
                        '2021',
                        style: TextStyle(
                          fontSize: ConstantSize.big,
                          color: Colors.white30,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 250),
          ],
        ),
      ),
    );
  }
}
