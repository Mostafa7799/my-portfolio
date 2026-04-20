import '../models/portfolio_models.dart';

const skills = [
  'Flutter',
  'Dart',
  'REST APIs',
  'Firebase',
  'State Management',
  'Unit Testing',
  'Clean Architecture',
  'SOLID / OOP',
  'Git / GitHub',
  'CI/CD',
  'Python',
  'Java SE',
  'Database Design',
];

const projects = [
  ProjectItem(
    title: LocalizedText(en: 'Next App', ar: 'نكست آب'),
    description: LocalizedText(
      en: 'Mobile version of ERPNext enabling seamless access to ERP functionalities on the go.',
      ar: 'نسخة موبايل من ERPNext تُتيح الوصول إلى وظائف النظام بسهولة من أي مكان.',
    ),
    role: LocalizedText(
      en: 'Flutter Developer — end-to-end feature ownership',
      ar: 'مطور Flutter — مسؤولية كاملة عن الميزات',
    ),
    impact: LocalizedText(
      en: 'Implemented real-time inventory, customer insights, and sales tracking; improved UI and app stability.',
      ar: 'تنفيذ المخزون الفوري وتحليلات العملاء ومتابعة المبيعات، مع تحسين الواجهة والاستقرار.',
    ),
    techStack: ['Flutter', 'Dart', 'REST APIs', 'Clean Architecture'],
    appStoreUrl: 'https://apps.apple.com/us/app/nextapp-ecs/id6449401732',
    playStoreUrl: 'https://play.google.com/store/apps/details?id=mobi.nextapp.next_app',
  ),
  ProjectItem(
    title: LocalizedText(en: 'ECS', ar: 'ECS'),
    description: LocalizedText(
      en: 'ERPCloud.Systems\' internal ERP app that simplifies employee operations and HR management.',
      ar: 'تطبيق ERP الداخلي لشركة ERPCloud.Systems لتبسيط عمليات الموظفين وإدارة الموارد البشرية.',
    ),
    role: LocalizedText(
      en: 'Flutter Developer — full feature ownership',
      ar: 'مطور Flutter — مسؤولية كاملة عن الميزات',
    ),
    impact: LocalizedText(
      en: 'Implemented task management, attendance logging, and automated timesheet tracking with admin dashboards.',
      ar: 'تنفيذ إدارة المهام وتسجيل الحضور وتتبع ساعات العمل آلياً مع لوحات تحكم للمديرين.',
    ),
    techStack: ['Flutter', 'Dart', 'Firebase', 'REST APIs'],
    appStoreUrl: 'https://apps.apple.com/us/app/ecs/id6740812589',
    playStoreUrl: 'https://play.google.com/store/apps/details?id=com.erpcloud.systems.app',
  ),
  ProjectItem(
    title: LocalizedText(en: 'TRENDY Store', ar: 'ترندي ستور'),
    description: LocalizedText(
      en: 'Fashion aggregator that syncs listings from 100+ brands with integrated order and shipping modules.',
      ar: 'تطبيق تسوق يجمع منتجات من 100+ علامة تجارية مع وحدات الطلبات والشحن.',
    ),
    role: LocalizedText(
      en: 'Flutter Developer — full feature ownership',
      ar: 'مطور Flutter — مسؤولية كاملة',
    ),
    impact: LocalizedText(
      en: 'Aggregates products from 100+ fashion brands; seamless multi-brand checkout experience.',
      ar: 'تجميع منتجات من 100+ علامة تجارية وتجربة دفع متكاملة.',
    ),
    techStack: ['Flutter', 'Dart', 'REST APIs', 'Clean Architecture'],
    appStoreUrl: 'https://apps.apple.com/us/app/treandy/id6745932547',
  ),
  ProjectItem(
    title: LocalizedText(en: 'Khadamati (خدماتي)', ar: 'خدماتي'),
    description: LocalizedText(
      en: 'HR/attendance app for The Equestrian Authority of Saudi Arabia with live tracking and geofencing.',
      ar: 'تطبيق حضور وانصراف لهيئة الفروسية السعودية مع التتبع الحي والسياج الجغرافي.',
    ),
    role: LocalizedText(
      en: 'Flutter Developer — end-to-end delivery',
      ar: 'مطور Flutter — تسليم كامل',
    ),
    impact: LocalizedText(
      en: 'Automated attendance for field staff via live GPS tracking and geofencing.',
      ar: 'أتمتة تسجيل الحضور للموظفين الميدانيين عبر GPS والسياج الجغرافي.',
    ),
    techStack: ['Flutter', 'Dart', 'REST APIs', 'Maps', 'Geofencing'],
    appStoreUrl: 'https://apps.apple.com/us/app/%D8%AE%D8%AF%D9%85%D8%A7%D8%AA%D9%8A-%D9%87%D9%8A%D8%A6%D8%A9-%D8%A7%D9%84%D9%81%D8%B1%D9%88%D8%B3%D9%8A%D8%A9/id6741025115',
  ),
  ProjectItem(
    title: LocalizedText(en: 'Pure Power', ar: 'بيور باور'),
    description: LocalizedText(
      en: 'CRM for managing maintenance visits with scheduling, progress tracking, and automated reports.',
      ar: 'نظام CRM لإدارة زيارات الصيانة مع الجدولة ومتابعة التقدم والتقارير الآلية.',
    ),
    role: LocalizedText(
      en: 'Flutter Developer — end-to-end delivery',
      ar: 'مطور Flutter — تسليم كامل',
    ),
    impact: LocalizedText(
      en: 'Streamlined maintenance workflows and automated report generation for field teams.',
      ar: 'تبسيط سير عمل الصيانة وإنشاء التقارير آلياً للفرق الميدانية.',
    ),
    techStack: ['Flutter', 'Dart', 'REST APIs', 'Clean Architecture'],
    appStoreUrl: 'https://apps.apple.com/us/app/pure-power/id6752708303',
  ),
  ProjectItem(
    title: LocalizedText(en: 'Shari', ar: 'شاري'),
    description: LocalizedText(
      en: 'Loan management app with categorized records, reminders, and secure sharing.',
      ar: 'تطبيق إدارة القروض مع السجلات المصنفة والتذكيرات والمشاركة الآمنة.',
    ),
    role: LocalizedText(
      en: 'Flutter Developer — sole developer',
      ar: 'مطور Flutter — مطور منفرد',
    ),
    impact: LocalizedText(
      en: 'Organized loan tracking with automated reminders and secure peer sharing.',
      ar: 'تنظيم متابعة القروض مع تذكيرات آلية ومشاركة آمنة.',
    ),
    techStack: ['Flutter', 'Dart', 'Firebase'],
    playStoreUrl: 'https://play.google.com/store/apps/details?id=com.soultech.shari',
  ),
  ProjectItem(
    title: LocalizedText(en: 'EAT', ar: 'EAT'),
    description: LocalizedText(
      en: 'E-commerce app with guest mode, offline cart, and streamlined checkout experience.',
      ar: 'تطبيق تجارة إلكترونية مع وضع الضيف وسلة الشراء بدون إنترنت وتجربة دفع سلسة.',
    ),
    role: LocalizedText(
      en: 'Flutter Developer — end-to-end delivery',
      ar: 'مطور Flutter — تسليم كامل',
    ),
    impact: LocalizedText(
      en: 'Enabled guest checkout and offline cart to reduce friction and increase conversions.',
      ar: 'تفعيل الدفع كضيف والسلة بدون إنترنت لتقليل الاحتكاك وزيادة التحويلات.',
    ),
    techStack: ['Flutter', 'Dart', 'REST APIs'],
    appStoreUrl: 'https://apps.apple.com/us/app/e-a-t/id6642673181',
  ),
  ProjectItem(
    title: LocalizedText(en: 'Alkhabbaz', ar: 'الخباز'),
    description: LocalizedText(
      en: 'Sales app with real-time stock validation and Bluetooth invoice printing.',
      ar: 'تطبيق مبيعات مع التحقق الفوري من المخزون وطباعة الفواتير عبر البلوتوث.',
    ),
    role: LocalizedText(
      en: 'Flutter Developer — feature enhancement',
      ar: 'مطور Flutter — تطوير الميزات',
    ),
    impact: LocalizedText(
      en: 'Improved daily sales operations with stock validation and in-field invoice printing.',
      ar: 'تحسين عمليات البيع اليومية بالتحقق من المخزون وطباعة الفواتير ميدانياً.',
    ),
    techStack: ['Flutter', 'Dart', 'REST APIs', 'Bluetooth'],
    playStoreUrl: 'https://play.google.com/store/apps/details?id=com.alkhabbaz.system',
  ),
  ProjectItem(
    title: LocalizedText(en: 'Future Academy', ar: 'فيوتشر أكاديمي'),
    description: LocalizedText(
      en: 'Sports academy app with tailored interfaces for managers and captains, player data management, and training insights.',
      ar: 'تطبيق أكاديمية رياضية بواجهات مخصصة للمديرين والكابتن وإدارة بيانات اللاعبين.',
    ),
    role: LocalizedText(
      en: 'Flutter Developer — full feature ownership',
      ar: 'مطور Flutter — مسؤولية كاملة',
    ),
    impact: LocalizedText(
      en: 'Streamlined academy management with role-based dashboards and subscription tracking.',
      ar: 'تبسيط إدارة الأكاديمية بلوحات تحكم حسب الدور ومتابعة الاشتراكات.',
    ),
    techStack: ['Flutter', 'Dart', 'REST APIs', 'Clean Architecture'],
  ),
  ProjectItem(
    title: LocalizedText(en: 'Asen', ar: 'آسن'),
    description: LocalizedText(
      en: 'Medical platform with patient management, payments, and video/audio consultation calls.',
      ar: 'منصة طبية مع إدارة المرضى والمدفوعات ومكالمات الاستشارة بالفيديو والصوت.',
    ),
    role: LocalizedText(
      en: 'Flutter Developer — feature additions',
      ar: 'مطور Flutter — إضافة ميزات',
    ),
    impact: LocalizedText(
      en: 'Added 10+ features including patient management, payments, and video/audio calls.',
      ar: 'إضافة 10+ ميزات تشمل إدارة المرضى والمدفوعات والاستشارات عبر الفيديو.',
    ),
    techStack: ['Flutter', 'Dart', 'REST APIs', 'WebRTC'],
  ),
  ProjectItem(
    title: LocalizedText(en: 'CLOTH IT', ar: 'كلوث إت'),
    description: LocalizedText(
      en: 'Multi-vendor e-commerce platform with admin and vendor dashboards and scalable architecture.',
      ar: 'منصة تجارة إلكترونية متعددة البائعين مع لوحات تحكم للمسؤولين والبائعين.',
    ),
    role: LocalizedText(
      en: 'Flutter Developer — architecture & implementation',
      ar: 'مطور Flutter — البنية والتنفيذ',
    ),
    impact: LocalizedText(
      en: 'Designed scalable multi-vendor architecture supporting admin and vendor role management.',
      ar: 'تصميم بنية متعددة البائعين قابلة للتوسع تدعم إدارة أدوار المسؤولين والبائعين.',
    ),
    techStack: ['Flutter', 'Dart', 'REST APIs', 'Clean Architecture'],
  ),
];

const experiences = [
  ExperienceItem(
    company: 'ERPCloud.Systems',
    title: LocalizedText(
      en: 'Flutter Developer — Full Time',
      ar: 'مطور Flutter — دوام كامل',
    ),
    period: LocalizedText(en: 'Jun 2023 – Present', ar: 'يونيو ٢٠٢٣ – حتى الآن'),
    summary: LocalizedText(
      en: 'Developed and maintained production mobile apps in Flutter; shipped new features and improved UX. '
          'Managed end-to-end delivery from concept to store launch. Enhanced key applications such as '
          'NextApp, Alkhabbaz, and ClassA through data-driven feature updates and UX improvements. '
          'Ensured high code quality through unit testing, clean architecture, and continuous code review.',
      ar: 'تطوير وصيانة تطبيقات موبايل إنتاجية بـ Flutter وإطلاق ميزات جديدة وتحسين تجربة المستخدم. '
          'إدارة دورة التسليم الكاملة من الفكرة إلى المتجر. تطوير تطبيقات NextApp وAlkhabbaz وClassA. '
          'ضمان جودة الكود عبر الاختبارات الوحدوية والبنية النظيفة ومراجعة الكود المستمرة.',
    ),
  ),
  ExperienceItem(
    company: 'IMPACT',
    title: LocalizedText(
      en: 'Flutter Developer — Part Time',
      ar: 'مطور Flutter — دوام جزئي',
    ),
    period: LocalizedText(en: 'Oct 2024 – Present', ar: 'أكتوبر ٢٠٢٤ – حتى الآن'),
    summary: LocalizedText(
      en: 'Built HR/attendance apps that automated workflows and improved employee efficiency. '
          'Developed POS solutions with intuitive UIs and reliable performance.',
      ar: 'بناء تطبيقات الحضور والموارد البشرية التي تؤتمت سير العمل وحسّنت كفاءة الموظفين. '
          'تطوير حلول نقاط البيع بواجهات سهلة الاستخدام وأداء موثوق.',
    ),
  ),
  ExperienceItem(
    company: '3C',
    title: LocalizedText(
      en: 'Flutter Instructor',
      ar: 'مدرب Flutter',
    ),
    period: LocalizedText(en: 'Jun 2023 – Dec 2024', ar: 'يونيو ٢٠٢٣ – ديسمبر ٢٠٢٤'),
    summary: LocalizedText(
      en: 'Taught Dart fundamentals and Flutter framework to students; guided hands-on projects and debugging sessions.',
      ar: 'تدريس أساسيات Dart وإطار Flutter للطلاب مع توجيه مشاريع عملية وجلسات تصحيح الأخطاء.',
    ),
  ),
  ExperienceItem(
    company: 'Techno Space',
    title: LocalizedText(
      en: 'Flutter Developer — Intern',
      ar: 'مطور Flutter — متدرب',
    ),
    period: LocalizedText(en: 'Jun 2022 – Dec 2022', ar: 'يونيو ٢٠٢٢ – ديسمبر ٢٠٢٢'),
    summary: LocalizedText(
      en: 'Collaborated using Git/GitHub; built IoT and E-Commerce demo apps; strengthened teamwork and project ownership.',
      ar: 'العمل الجماعي باستخدام Git/GitHub وبناء تطبيقات IoT والتجارة الإلكترونية التجريبية.',
    ),
  ),
];

const socialLinks = {
  'github': 'https://github.com/Mostafa7799',
  'linkedin': 'https://www.linkedin.com/in/mostafa-mahmoud7',
  'email': 'mailto:mostafa.elmanuawey2@gmail.com',
};

