import 'package:flutter/widgets.dart';

class LocalizedText {
  const LocalizedText({required this.en, required this.ar});

  final String en;
  final String ar;

  String of(Locale locale) => locale.languageCode == 'ar' ? ar : en;
}

class ProjectItem {
  const ProjectItem({
    required this.title,
    required this.description,
    required this.role,
    required this.impact,
    required this.techStack,
    required this.githubUrl,
    required this.demoUrl,
  });

  final LocalizedText title;
  final LocalizedText description;
  final LocalizedText role;
  final LocalizedText impact;
  final List<String> techStack;
  final String githubUrl;
  final String demoUrl;
}

class ExperienceItem {
  const ExperienceItem({
    required this.company,
    required this.title,
    required this.period,
    required this.summary,
  });

  final String company;
  final LocalizedText title;
  final LocalizedText period;
  final LocalizedText summary;
}
