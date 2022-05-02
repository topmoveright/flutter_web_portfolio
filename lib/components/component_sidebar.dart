import 'package:flutter/material.dart';

class ComponentSidebar extends StatelessWidget {
  const ComponentSidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: const Text('side'),
    );
  }
}
