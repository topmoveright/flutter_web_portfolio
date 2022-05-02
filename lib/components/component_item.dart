import 'package:flutter/material.dart';
import 'package:portfolio/constants/constant_size.dart';
import 'package:portfolio/constants/constant_text_style.dart';
import 'package:portfolio/models/model_project.dart';

class ComponentItem extends StatefulWidget {
  const ComponentItem({Key? key, required this.item}) : super(key: key);

  final ModelProject item;

  @override
  _ComponentItemState createState() => _ComponentItemState();
}

class _ComponentItemState extends State<ComponentItem> {

  final double itemWidth = 520.0;
  final double itemHeight = 250.0;

  bool visible = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onHover: (event) {
        setState(() {
          visible = true;
        });
      },
      onExit: (event) {
        setState(() {
          visible = false;
        });
      },
      child: Card(
        elevation: 8.0,
        shadowColor: Colors.black12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ConstantSize.x2),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(ConstantSize.x2),
          child: SizedBox(
            width: itemWidth,
            height: itemHeight,
            child: Stack(
              children: [
                AnimatedScale(
                  duration: const Duration(milliseconds: 500),
                  scale: visible ? 1.2 :  1.0,
                  curve: Curves.easeOut,
                  child: GridTile(
                    child: Hero(
                      tag: widget.item.subject,
                      child: Image.asset(
                        widget.item.mainImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                    footer: GridTileBar(
                      backgroundColor: Colors.black12,
                      title: Text(widget.item.subject),
                    ),
                  ),
                ),
                AnimatedOpacity(
                  opacity: visible ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                  child: Container(
                    width: double.maxFinite,
                    height: double.maxFinite,
                    color: Colors.black54,
                    child: Center(
                      child: Text(
                        widget.item.subject,
                        style: ConstantTextStyle.fontPressStart2P.copyWith(
                          color: Colors.white,
                          fontSize: ConstantSize.x3,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
