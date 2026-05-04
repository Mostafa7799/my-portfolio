import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import '../widgets/section_wrapper.dart';
import '../widgets/section_title.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final primary = Theme.of(context).colorScheme.primary;

    return SectionWrapper(
      background: Theme.of(context).colorScheme.surfaceContainerLowest,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: l10n.t('about_title')),
          const SizedBox(height: 20),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 820),
            child: Text(
              l10n.t('about_summary'),
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(height: 1.75),
            ),
          ),
          const SizedBox(height: 36),
          Wrap(
            spacing: 24,
            runSpacing: 16,
            children: [
              _StatBadge(value: '3+', label: l10n.t('stat_years'), primary: primary),
              _StatBadge(value: '20+', label: l10n.t('stat_apps'), primary: primary),
              _StatBadge(value: '11+', label: l10n.t('stat_projects'), primary: primary),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatBadge extends StatelessWidget {
  const _StatBadge({
    required this.value,
    required this.label,
    required this.primary,
  });
  final String value;
  final String label;
  final Color primary;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      decoration: BoxDecoration(
        color: primary.withOpacity(0.08),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: primary.withOpacity(0.22)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: primary,
                  fontWeight: FontWeight.w800,
                ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ),
    );
  }
}
