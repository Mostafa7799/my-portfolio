import 'package:flutter/widgets.dart';

class AppLocalizations {
  const AppLocalizations(this.locale);

  final Locale locale;

  static const supportedLocales = [Locale('en'), Locale('ar')];

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static const Map<String, Map<String, String>> _values = {
    'en': {
      'nav_home': 'Home',
      'nav_about': 'About',
      'nav_skills': 'Skills',
      'nav_projects': 'Projects',
      'nav_experience': 'Experience',
      'nav_contact': 'Contact',
      'hero_title': 'Flutter Developer',
      'hero_subtitle':
          'Flutter developer with 3+ years of experience delivering high-quality mobile apps. Published 20+ production apps on the App Store and Google Play.',
      'view_projects': 'View Projects',
      'view_cv': 'View CV',
      'download_cv': 'Download CV',
      'contact_me': 'Contact Me',
      'about_title': 'About Me',
      'about_summary':
          'Flutter developer with 3+ years of experience delivering high-quality mobile applications. Proven ability to lead projects from concept to deployment while ensuring performance, scalability, and seamless user experience. Successfully published over 20 production apps on the App Store and Google Play.',
      'skills_title': 'Skills',
      'projects_title': 'Projects',
      'experience_title': 'Experience',
      'contact_title': 'Contact',
      'contact_name': 'Name',
      'contact_email': 'Email',
      'contact_message': 'Message',
      'contact_send': 'Send Message',
      'contact_success': 'Message is ready to send. Integrate your backend/email API next.',
      'required_field': 'This field is required',
      'invalid_email': 'Please enter a valid email',
      'project_github': 'GitHub',
      'project_demo': 'Live Demo',
      'project_app_store': 'App Store',
      'project_play_store': 'Play Store',
      'footer_text': '© 2026 Mostafa Mahmoud. All rights reserved.',
      'social_github': 'GitHub',
      'social_linkedin': 'LinkedIn',
      'social_email': 'Email',
      'timeline_present': 'Present',
      'language_toggle': 'EN | AR',
      'theme_toggle': 'Theme',
      'hero_name': 'Mostafa Mahmoud',
    },
    'ar': {
      'nav_home': 'الرئيسية',
      'nav_about': 'نبذة',
      'nav_skills': 'المهارات',
      'nav_projects': 'المشاريع',
      'nav_experience': 'الخبرات',
      'nav_contact': 'تواصل',
      'hero_title': 'مطور Flutter',
      'hero_subtitle':
          'مطور Flutter بخبرة 3+ سنوات في تطوير تطبيقات موبايل عالية الجودة. نشرت 20+ تطبيقاً إنتاجياً على App Store و Google Play.',
      'view_projects': 'عرض المشاريع',
      'view_cv': 'عرض السيرة الذاتية',
      'download_cv': 'تحميل السيرة الذاتية',
      'contact_me': 'تواصل معي',
      'about_title': 'نبذة عني',
      'about_summary':
          'مطور Flutter بخبرة 3+ سنوات في تطوير تطبيقات موبايل عالية الجودة. قدرة مثبتة على قيادة المشاريع من الفكرة حتى الإطلاق مع ضمان الأداء وقابلية التوسع وتجربة مستخدم سلسة. نشرت أكثر من 20 تطبيقاً إنتاجياً على App Store و Google Play.',
      'skills_title': 'المهارات',
      'projects_title': 'المشاريع',
      'experience_title': 'الخبرات العملية',
      'contact_title': 'تواصل',
      'contact_name': 'الاسم',
      'contact_email': 'البريد الإلكتروني',
      'contact_message': 'الرسالة',
      'contact_send': 'إرسال الرسالة',
      'contact_success':
          'الرسالة جاهزة للإرسال. يمكنك ربط النموذج بخدمة بريد إلكتروني أو API.',
      'required_field': 'هذا الحقل مطلوب',
      'invalid_email': 'يرجى إدخال بريد إلكتروني صحيح',
      'project_github': 'جيت هب',
      'project_demo': 'عرض حي',
      'project_app_store': 'آب ستور',
      'project_play_store': 'بلاي ستور',
      'footer_text': '© ٢٠٢٦ مصطفى محمود. جميع الحقوق محفوظة.',
      'social_github': 'جيت هب',
      'social_linkedin': 'لينكدإن',
      'social_email': 'البريد',
      'timeline_present': 'حتى الآن',
      'language_toggle': 'AR | EN',
      'theme_toggle': 'المظهر',
      'hero_name': 'مصطفى محمود',
    }
  };

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  String t(String key) => _values[locale.languageCode]?[key] ?? key;

  bool get isArabic => locale.languageCode == 'ar';
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      AppLocalizations.supportedLocales
          .any((supportedLocale) => supportedLocale.languageCode == locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async => AppLocalizations(locale);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

extension LocalizationX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
