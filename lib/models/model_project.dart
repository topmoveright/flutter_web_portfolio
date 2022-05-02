import 'package:portfolio/models/model_ability.dart';

class ModelProject {
  final String category;
  final String subject;
  final String description;
  final String mainImage;
  final List<String> detailImages;
  final List<ModelAbility> abilities;
  final int periodDays;

  const ModelProject({
    required this.category,
    required this.subject,
    required this.description,
    required this.mainImage,
    required this.detailImages,
    required this.abilities,
    required this.periodDays,
  });

  String get periodStr {
    int days = periodDays;
    String yearStr = '';
    String monthStr = '';
    String dayStr = '';

    if (days >= 365) {
      yearStr = '${days ~/ 365} ${days >= 365 * 2 ? 'years' : 'year'} ';
      days = days % 365;
    }

    if (days >= 30) {
      monthStr = '${days ~/ 30} ${days >= 30 * 2 ? 'months' : 'month'} ';
      days = days % 30;
    }

    if (days > 0) {
      dayStr = '$days ${days > 1 ? 'days' : 'day'}';
    }

    return '$yearStr$monthStr$dayStr';
  }
}
