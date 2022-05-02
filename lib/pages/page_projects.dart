import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/components/component_item.dart';
import 'package:portfolio/constants/constant_project.dart';
import 'package:portfolio/constants/constant_size.dart';
import 'package:portfolio/constants/constant_text_style.dart';
import 'package:portfolio/layout.dart';
import 'package:portfolio/models/model_project.dart';
import 'package:portfolio/pages/page_project_detail.dart';

class PageProjects extends StatefulWidget {
  const PageProjects({Key? key}) : super(key: key);

  @override
  State<PageProjects> createState() => _PageProjectsState();
}

class _PageProjectsState extends State<PageProjects> {
  final double itemWidth = 520.0;
  final double itemHeight = 250.0;

  var visible = false;
  late List<bool> _projectVisibleStates;

  Set<String> get categories =>
      {'all', ...ConstantProject.list.map((e) => e.category)};

  int categoryIndex = 0;

  List<ModelProject> projectList = ConstantProject.list;

  @override
  void initState() {
    super.initState();
    _projectVisibleStates = List.generate(projectList.length, (index) => false);

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      // !setState() called after dispose()
      // mounted 로 확인
      if (mounted) {
        setState(() {
          if (_projectVisibleStates.isNotEmpty) {
            _projectVisibleStates[0] = true;
          }
        });
      }
    });
  }

  void setCategory(int index) {
    categoryIndex = index;
    setState(() {
      projectList = index == 0
          ? ConstantProject.list
          : ConstantProject.list
              .where((e) => e.category == categories.elementAt(index))
              .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      fullWidth: true,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: ConstantSize.big),
            child: ButtonBar(
              alignment: MainAxisAlignment.center,
              children: List.generate(
                categories.length,
                (index) => buildFilterMenu(
                  title: categories.elementAt(index),
                  onPressed: () => setCategory(index),
                  isActive: index == categoryIndex,
                ),
              ),
            ),
          ),
          Container(
            constraints: const BoxConstraints(
              minHeight: 600.0,
            ),
            child: Wrap(
              spacing: ConstantSize.x2,
              runSpacing: ConstantSize.x2,
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.start,
              runAlignment: WrapAlignment.start,
              children: List.generate(
                projectList.length,
                (index) => buildItem(index),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItem(int index) {
    var item = projectList[index];
    return GestureDetector(
      onTap: () => Get.to(
        () => PageProjectDetail(tag: item.subject, project: item),
        transition: Transition.noTransition,
      ),
      child: AnimatedOpacity(
        onEnd: () {
          WidgetsBinding.instance?.addPostFrameCallback((_) {
            if (index < projectList.length - 1 && mounted) {
              setState(() {
                _projectVisibleStates[index + 1] = true;
              });
            }
          });
        },
        opacity: _projectVisibleStates[index] ? 1.0 : 0.0,
        curve: Curves.easeInExpo,
        duration: const Duration(milliseconds: 300),
        child: ComponentItem(item: item),
      ),
    );
  }

  TextButton buildFilterMenu({
    required VoidCallback onPressed,
    required String title,
    bool isActive = false,
  }) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title.toUpperCase(),
        style: ConstantTextStyle.fontSourceCodePro.copyWith(
          fontSize: ConstantSize.x3,
          color: isActive ? Get.theme.primaryColor : Colors.black38,
        ),
      ),
    );
  }
}
