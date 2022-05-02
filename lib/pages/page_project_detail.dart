import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/components/component_image_slider.dart';
import 'package:portfolio/constants/constant_size.dart';
import 'package:portfolio/constants/constant_text_style.dart';
import 'package:portfolio/models/model_project.dart';
import 'package:portfolio/responsive.dart';

class PageProjectDetail extends StatelessWidget {
  const PageProjectDetail({Key? key, required this.tag, required this.project})
      : super(key: key);

  final Object tag;
  final ModelProject project;

  final double heroHeight = 250.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  buildHero(),
                  Padding(
                    padding: const EdgeInsets.all(ConstantSize.big),
                    child: Responsive(
                      desktop: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 6,
                            child: ComponentImageSlider(project.detailImages),
                          ),
                          const SizedBox(width: ConstantSize.x3),
                          Expanded(
                            flex: 4,
                            child: buildDescription(),
                          ),
                        ],
                      ),
                      mobile: Column(
                        children: [
                          ComponentImageSlider(project.detailImages),
                          buildDescription(),
                        ],
                      ),
                      tablet: Column(
                        children: [
                          ComponentImageSlider(project.detailImages),
                          buildDescription(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topRight,
                child: buildCloseButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCloseButton() {
    return Padding(
      padding: const EdgeInsets.all(ConstantSize.x2),
      child: InkWell(
        onTap: () => Get.back(),
        child: Container(
          padding: const EdgeInsets.all(ConstantSize.x),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.close,
            size: ConstantSize.big,
          ),
        ),
      ),
    );
  }

  Widget buildHero() {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        SizedBox(
          width: double.infinity,
          height: heroHeight,
          child: Hero(
            tag: tag,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(project.mainImage),
                  colorFilter: const ColorFilter.mode(
                    Colors.black,
                    BlendMode.softLight,
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: heroHeight,
          color: Colors.black.withOpacity(0.5),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: ConstantSize.big,
            bottom: ConstantSize.big * 2,
          ),
          child: Text(
            project.subject,
            style: ConstantTextStyle.fontPressStart2P.copyWith(
              fontSize: ConstantSize.x3,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          minLeadingWidth: 100.0,
          leading: const Text('작업기간'),
          title: Text(project.periodStr),
        ),
        ListTile(
          minLeadingWidth: 100.0,
          leading: const Text('작업내용'),
          title: Text(project.description),
        ),
        const ListTile(
          minLeadingWidth: 100.0,
          leading: Text('적용기술'),
          title: SizedBox.shrink(),
        ),
        for (var item in project.abilities)
          buildAbility(item.subject, item.percentage)
      ],
    );
  }

  Widget buildAbility(String subject, double percent) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: ConstantSize.x2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              children: [
                const WidgetSpan(
                  child: Icon(
                    Icons.arrow_right,
                    color: Colors.black12,
                  ),
                  alignment: PlaceholderAlignment.middle,
                ),
                const WidgetSpan(
                  child: SizedBox(
                    width: ConstantSize.x,
                  ),
                ),
                TextSpan(
                  text: subject.toUpperCase(),
                  style: ConstantTextStyle.fontSourceCodePro
                      .copyWith(fontSize: ConstantSize.x3),
                ),
              ],
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  strokeWidth: ConstantSize.x,
                  value: percent,
                  backgroundColor: Colors.black12,
                ),
              ),
              Center(
                child: Text(
                  '${(percent * 100).toInt()}%',
                  style: const TextStyle(fontSize: ConstantSize.x2),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
