import 'package:flutter/material.dart';
import 'package:portfolio/constants/constant_size.dart';
import 'package:portfolio/constants/constant_text_style.dart';
import 'package:portfolio/layout.dart';

class PageAbout extends StatelessWidget {
  const PageAbout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: ConstantSize.big),
            child: Row(
              children: [
                Flexible(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'What is Lorem Ipsum?',
                        style: ConstantTextStyle.fontPressStart2P
                            .copyWith(fontSize: ConstantSize.x3),
                      ),
                      const SizedBox(height: ConstantSize.big),
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                                text:
                                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'
                                    'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took '
                                    'a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, '
                                    'but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the '
                                    '1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop '
                                    'publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Flexible(
                  flex: 4,
                  child: Center(
                    child: CircleAvatar(
                      maxRadius: 100.0,
                      backgroundImage: AssetImage('images/man.jpg'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: ConstantSize.big),
            child: ClipRect(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 200,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'images/kwangju.jpg',
                        ),
                        fit: BoxFit.cover,
                        colorFilter:
                            ColorFilter.mode(Colors.black, BlendMode.color),
                      ),
                    ),
                  ),
                  Container(
                    height: 200,
                    decoration: const BoxDecoration(
                      /*boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 300.0,
                          ),
                        ],*/
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Colors.black38,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        const Icon(
                          Icons.location_pin,
                          color: Colors.white,
                        ),
                        const SizedBox(height: ConstantSize.x2),
                        Padding(
                          padding: const EdgeInsets.symmetric( horizontal: ConstantSize.x2),
                          child: Text(
                            'KWANGJU, REPUBLIC OF KOREA',
                            style: ConstantTextStyle.fontPressStart2P.copyWith(
                              fontSize: ConstantSize.x3,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: ConstantSize.big),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.desktop_mac),
                  title: const Text('PROGRAMMING'),
                  subtitle: Wrap(
                    runSpacing: ConstantSize.x,
                    spacing: ConstantSize.x,
                    children: [
                      skillBox('Dart'),
                      skillBox('Python'),
                      skillBox('Javascript'),
                      skillBox('PHP'),
                      skillBox('Html/Css'),
                    ],
                  ),
                ),
                const SizedBox(height: ConstantSize.big),
                ListTile(
                  leading: const Icon(Icons.task),
                  title: const Text('TECHNOLOGIES'),
                  subtitle: Wrap(
                    runSpacing: ConstantSize.x,
                    spacing: ConstantSize.x,
                    children: [
                      skillBox('Flutter'),
                      skillBox('Nodejs'),
                      skillBox('Django'),
                      skillBox('Electron'),
                      skillBox('React'),
                      skillBox('Strapi'),
                      skillBox('CI'),
                      skillBox('Git'),
                      skillBox('Mysql'),
                      skillBox('Sqlite'),
                      skillBox('MongoDB'),
                      skillBox('Postgresql'),
                      skillBox('Docker'),
                      skillBox('Linux'),
                      skillBox('Nginx'),
                      skillBox('Express'),
                      skillBox('Firebase'),
                      skillBox('Admob'),
                      skillBox('Photoshop'),
                      skillBox('Illustrator'),
                      skillBox('Admob'),
                      skillBox('Rhino'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget skillBox(String subject) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: ConstantSize.x2, vertical: ConstantSize.x),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ConstantSize.x),
        border: Border.all(
          color: Colors.black12,
          width: 1,
        ),
      ),
      child: Text(subject),
    );
  }
}
