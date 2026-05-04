import 'package:flutter/material.dart';

import '../../data/portfolio_data.dart';
import '../../l10n/app_localizations.dart';
import '../widgets/section_wrapper.dart';
import '../widgets/section_title.dart';

// Skill → category mapping for colour coding
const _skillCategories = {
  'Flutter': _SkillCat.mobile,
  'Dart': _SkillCat.mobile,
  'REST APIs': _SkillCat.backend,
  'Firebase': _SkillCat.backend,
  'State Management': _SkillCat.mobile,
  'Unit Testing': _SkillCat.tools,
  'Clean Architecture': _SkillCat.tools,
  'SOLID / OOP': _SkillCat.tools,
  'Git / GitHub': _SkillCat.tools,
  'CI/CD': _SkillCat.tools,
  'Python': _SkillCat.backend,
  'Java SE': _SkillCat.backend,
  'Database Design': _SkillCat.backend,
};

enum _SkillCat { mobile, backend, tools }

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return SectionWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: l10n.t('skills_title')),
          const SizedBox(height: 8),
          _Legend(l10n: l10n),
          const SizedBox(height: 20),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: skills.map((skill) => _SkillChip(skill: skill)).toList(),
          ),
        ],
      ),
    );
  }
}

class _Legend extends StatelessWidget {
  const _Legend({required this.l10n});
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 4,
      children: [
        _LegendDot(color: _catColor(_SkillCat.mobile, context), label: l10n.t('skill_cat_mobile')),
        _LegendDot(color: _catColor(_SkillCat.backend, context), label: l10n.t('skill_cat_backend')),
        _LegendDot(color: _catColor(_SkillCat.tools, context), label: l10n.t('skill_cat_tools')),
      ],
    );
  }
}

class _LegendDot extends StatelessWidget {
  const _LegendDot({required this.color, required this.label});
  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 5),
        Text(label, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}

Color _catColor(_SkillCat cat, BuildContext context) {
  final scheme = Theme.of(context).colorScheme;
  return switch (cat) {
    _SkillCat.mobile => scheme.primary,
    _SkillCat.backend => scheme.tertiary,
    _SkillCat.tools => scheme.secondary,
  };
}

class _SkillChip extends StatefulWidget {
  const _SkillChip({required this.skill});
  final String skill;

  @override
  State<_SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<_SkillChip> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final cat = _skillCategories[widget.skill] ?? _SkillCat.tools;
    final color = _catColor(cat, context);

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: _hovered ? color.withOpacity(0.15) : color.withOpacity(0.08),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: _hovered ? color : color.withOpacity(0.4),
            width: _hovered ? 1.5 : 1,
          ),
        ),
        child: Text(
          widget.skill,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: color,
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
        ),
      ),
    );
  }
}
