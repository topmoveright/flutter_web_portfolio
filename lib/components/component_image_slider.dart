import 'package:flutter/material.dart';
import 'package:portfolio/constants/constant_size.dart';

class ComponentImageSlider extends StatefulWidget {
  const ComponentImageSlider(this.imagePathList, {Key? key}) : super(key: key);

  final List<String> imagePathList;

  @override
  _ComponentImageSliderState createState() => _ComponentImageSliderState();
}

class _ComponentImageSliderState extends State<ComponentImageSlider>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: widget.imagePathList.length, vsync: this);
    _pageController = PageController(
      initialPage: 0,
      keepPage: true,
    )..addListener(() {
        _tabController.index = _pageController.page!.toInt();
      });
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Stack(
        children: [
          Center(
            child: PageView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              controller: _pageController,
              itemCount: widget.imagePathList.length,
              itemBuilder: (context, index) => Card(
                child: Image.asset(
                  widget.imagePathList[index],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.only(left: ConstantSize.x3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.2),
              ),
              child: IconButton(
                iconSize: ConstantSize.big,
                color: Colors.black,
                onPressed: () => _pageController.previousPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn),
                icon: const Icon(Icons.navigate_before),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: const EdgeInsets.only(right: ConstantSize.x3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.2),
              ),
              child: IconButton(
                iconSize: ConstantSize.big,
                color: Colors.black,
                onPressed: () => _pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn),
                icon: const Icon(Icons.navigate_next),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: ConstantSize.big),
              child: TabPageSelector(
                controller: _tabController,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
