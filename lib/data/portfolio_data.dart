import '../models/portfolio_models.dart';

const skills = [
  'Flutter',
  'Dart',
  'Firebase',
  'REST APIs',
  'Clean Architecture',
  'Bloc',
  'Provider',
  'Riverpod',
  'Git',
  'CI/CD',
];

const projects = [
  ProjectItem(
    title: LocalizedText(en: 'FinTrack App', ar: 'تطبيق FinTrack'),
    description: LocalizedText(
      en: 'Personal finance app with budget planning and analytics dashboards.',
      ar: 'تطبيق إدارة مالية شخصية مع التخطيط للميزانية ولوحات تحليلية.',
    ),
    role: LocalizedText(
      en: 'Flutter Developer - full feature ownership',
      ar: 'مطور Flutter - مسؤولية كاملة عن الميزات',
    ),
    impact: LocalizedText(
      en: 'Improved user retention by 28% after redesigning onboarding flow.',
      ar: 'تحسين معدل الاحتفاظ بالمستخدمين بنسبة ٢٨٪ بعد إعادة تصميم تجربة البدء.',
    ),
    techStack: ['Flutter', 'Firebase', 'Bloc', 'Charts'],
    githubUrl: 'https://github.com/Mostafa7799',
    demoUrl: 'https://example.com/demo-fintrack',
  ),
  ProjectItem(
    title: LocalizedText(en: 'Clinic Connect', ar: 'كلينك كونكت'),
    description: LocalizedText(
      en: 'Appointment and teleconsultation platform for clinics and patients.',
      ar: 'منصة لحجز المواعيد والاستشارات عن بُعد بين العيادات والمرضى.',
    ),
    role: LocalizedText(
      en: 'Implemented booking flow and notifications',
      ar: 'تنفيذ مسار الحجز ونظام الإشعارات',
    ),
    impact: LocalizedText(
      en: 'Reduced manual booking calls by 40%.',
      ar: 'خفض المكالمات اليدوية لحجز المواعيد بنسبة ٤٠٪.',
    ),
    techStack: ['Flutter', 'REST API', 'Provider', 'FCM'],
    githubUrl: 'https://github.com/Mostafa7799',
    demoUrl: 'https://example.com/demo-clinic',
  ),
  ProjectItem(
    title: LocalizedText(en: 'EduPulse', ar: 'إديو بَلس'),
    description: LocalizedText(
      en: 'E-learning app with quizzes, progress tracking, and offline support.',
      ar: 'تطبيق تعليم إلكتروني مع اختبارات وتتبع التقدم ودعم العمل بدون إنترنت.',
    ),
    role: LocalizedText(
      en: 'Architected modular app layers with clean architecture',
      ar: 'تصميم طبقات التطبيق بشكل معياري باستخدام الهندسة النظيفة',
    ),
    impact: LocalizedText(
      en: 'Cut bug rate in releases by 35% through improved architecture.',
      ar: 'تقليل معدل الأخطاء في الإصدارات بنسبة ٣٥٪ بفضل تحسين البنية.',
    ),
    techStack: ['Flutter', 'Dart', 'Riverpod', 'SQLite'],
    githubUrl: 'https://github.com/Mostafa7799',
    demoUrl: 'https://example.com/demo-edupulse',
  ),
  ProjectItem(
    title: LocalizedText(en: 'StoreFront Pro', ar: 'ستور فرونت برو'),
    description: LocalizedText(
      en: 'E-commerce storefront app with secure checkout and product filters.',
      ar: 'تطبيق متجر إلكتروني مع دفع آمن وفلاتر متقدمة للمنتجات.',
    ),
    role: LocalizedText(
      en: 'Led UI implementation and API integration',
      ar: 'قيادة تنفيذ الواجهات ودمج واجهات البرمجة',
    ),
    impact: LocalizedText(
      en: 'Increased conversion rate by 18% after performance optimization.',
      ar: 'زيادة معدل التحويل بنسبة ١٨٪ بعد تحسين الأداء.',
    ),
    techStack: ['Flutter', 'REST APIs', 'Clean Architecture', 'GitHub Actions'],
    githubUrl: 'https://github.com/Mostafa7799',
    demoUrl: 'https://example.com/demo-storefront',
  ),
];

const experiences = [
  ExperienceItem(
    company: 'InnovateX Solutions',
    title: LocalizedText(
      en: 'Mid-Level Flutter Developer',
      ar: 'مطور Flutter متوسط الخبرة',
    ),
    period: LocalizedText(en: '2023 - Present', ar: '٢٠٢٣ - حتى الآن'),
    summary: LocalizedText(
      en: 'Building scalable cross-platform apps, implementing clean architecture, and mentoring junior developers.',
      ar: 'تطوير تطبيقات متعددة المنصات قابلة للتوسع، وتطبيق الهندسة النظيفة، وتوجيه المطورين الجدد.',
    ),
  ),
  ExperienceItem(
    company: 'CodeCrafters Studio',
    title: LocalizedText(
      en: 'Flutter Developer',
      ar: 'مطور Flutter',
    ),
    period: LocalizedText(en: '2021 - 2023', ar: '٢٠٢١ - ٢٠٢٣'),
    summary: LocalizedText(
      en: 'Delivered production apps with Firebase integrations and state management best practices.',
      ar: 'تسليم تطبيقات إنتاجية مع دمج Firebase وتطبيق أفضل ممارسات إدارة الحالة.',
    ),
  ),
];

const socialLinks = {
  'github': 'https://github.com/Mostafa7799',
  'linkedin': 'https://www.linkedin.com/in/mostafa-mahmoud-placeholder',
  'email': 'mailto:mostafa.mahmoud@example.com',
};
