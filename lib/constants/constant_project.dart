import 'package:portfolio/models/model_ability.dart';
import 'package:portfolio/models/model_project.dart';

class ConstantProject {
  static const list = [
    ModelProject(
      periodDays: 30,
      category: 'flutter',
      subject: 'subject1',
      description: 'description1',
      mainImage: 'images/project_dummy_1.jpg',
      detailImages: [
        'images/project_dummy_1.jpg',
        'images/project_dummy_2.png',
        'images/project_dummy_3.png',
        'images/project_dummy_4.jpg',
        'images/project_dummy_5.png',
      ],
      abilities: [
        ModelAbility('flutter', 0.7),
        ModelAbility('web', 0.3),
      ],
    ),
    ModelProject(
      periodDays: 60,
      category: 'web',
      subject: 'subject2',
      description: 'description2',
      mainImage: 'images/project_dummy_2.png',
      detailImages: [
        'images/project_dummy_1.jpg',
        'images/project_dummy_2.png',
        'images/project_dummy_3.png',
        'images/project_dummy_4.jpg',
        'images/project_dummy_5.png',
      ],
      abilities: [
        ModelAbility('flutter', 0.7),
        ModelAbility('web', 0.3),
      ],
    ),
    ModelProject(
      periodDays: 453,
      category: 'nodejs',
      subject: 'subject3',
      description: 'description3',
      mainImage: 'images/project_dummy_3.png',
      detailImages: [
        'images/project_dummy_1.jpg',
        'images/project_dummy_2.png',
        'images/project_dummy_3.png',
        'images/project_dummy_4.jpg',
        'images/project_dummy_5.png',
      ],
      abilities: [
        ModelAbility('flutter', 0.7),
        ModelAbility('web', 0.3),
      ],
    ),
    ModelProject(
      periodDays: 7,
      category: 'python',
      subject: 'subject4',
      description: 'description4',
      mainImage: 'images/project_dummy_4.jpg',
      detailImages: [
        'images/project_dummy_1.jpg',
        'images/project_dummy_2.png',
        'images/project_dummy_3.png',
        'images/project_dummy_4.jpg',
        'images/project_dummy_5.png',
      ],
      abilities: [
        ModelAbility('flutter', 0.7),
        ModelAbility('web', 0.3),
      ],
    ),
  ];
}
