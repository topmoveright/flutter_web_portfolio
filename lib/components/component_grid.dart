import 'package:flutter/material.dart';
import 'package:portfolio/constants/constant_size.dart';

class ComponentGird extends StatelessWidget {
  const ComponentGird({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: ConstantSize.x2,
      spacing: ConstantSize.x2,
      children: List.generate(
        20,
        (index) => const Card(
          elevation: 5,
          child: SizedBox(
            height: 300,
            width: 300,
            child: GridTile(
              child: FlutterLogo(),
              footer: GridTileBar(
                backgroundColor: Colors.grey,
                leading: Icon(Icons.chevron_right),
                title: Text('Instagram Clone'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
