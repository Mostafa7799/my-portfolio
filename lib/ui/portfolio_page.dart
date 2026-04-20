import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../state/app_settings_controller.dart';
import 'sections/about_section.dart';
import 'sections/contact_section.dart';
import 'sections/experience_section.dart';
import 'sections/footer_section.dart';
import 'sections/hero_section.dart';
import 'sections/projects_section.dart';
import 'sections/skills_section.dart';
import 'widgets/portfolio_navbar.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key, required this.controller});

  final AppSettingsController controller;

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final _scrollController = ScrollController();
  final _sectionKeys = {
    'home': GlobalKey(),
    'about': GlobalKey(),
    'skills': GlobalKey(),
    'projects': GlobalKey(),
    'experience': GlobalKey(),
    'contact': GlobalKey(),
  };

  String _activeSection = 'home';

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updateActiveSection);
    WidgetsBinding.instance.addPostFrameCallback((_) => _updateActiveSection());
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_updateActiveSection)
      ..dispose();
    super.dispose();
  }

  void _updateActiveSection() {
    String nearest = _activeSection;
    var nearestDistance = double.infinity;

    for (final entry in _sectionKeys.entries) {
      final context = entry.value.currentContext;
      if (context == null) continue;
      final box = context.findRenderObject() as RenderBox?;
      if (box == null || !box.hasSize) continue;
      final offset = box.localToGlobal(Offset.zero).dy;
      final distance = (offset - 120).abs();
      if (distance < nearestDistance) {
        nearestDistance = distance;
        nearest = entry.key;
      }
    }

    if (nearest != _activeSection && mounted) {
      setState(() => _activeSection = nearest);
    }
  }

  Future<void> _scrollTo(String section) async {
    final context = _sectionKeys[section]?.currentContext;
    if (context == null) return;
    await Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      alignment: 0.02,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final navItems = [
      NavItem(id: 'home', label: l10n.t('nav_home')),
      NavItem(id: 'about', label: l10n.t('nav_about')),
      NavItem(id: 'skills', label: l10n.t('nav_skills')),
      NavItem(id: 'projects', label: l10n.t('nav_projects')),
      NavItem(id: 'experience', label: l10n.t('nav_experience')),
      NavItem(id: 'contact', label: l10n.t('nav_contact')),
    ];

    return Scaffold(
      body: Column(
        children: [
          PortfolioNavbar(
            items: navItems,
            activeId: _activeSection,
            onNavigate: _scrollTo,
            onToggleLanguage: widget.controller.toggleLanguage,
            onToggleTheme: widget.controller.toggleTheme,
            isDark: widget.controller.themeMode == ThemeMode.dark,
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  KeyedSubtree(
                    key: _sectionKeys['home'],
                    child: HeroSection(onNavigate: _scrollTo),
                  ),
                  KeyedSubtree(key: _sectionKeys['about'], child: const AboutSection()),
                  KeyedSubtree(key: _sectionKeys['skills'], child: const SkillsSection()),
                  KeyedSubtree(key: _sectionKeys['projects'], child: const ProjectsSection()),
                  KeyedSubtree(
                    key: _sectionKeys['experience'],
                    child: const ExperienceSection(),
                  ),
                  KeyedSubtree(key: _sectionKeys['contact'], child: const ContactSection()),
                  const FooterSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
