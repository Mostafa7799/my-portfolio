import 'package:flutter/material.dart';

import '../../data/portfolio_data.dart';
import '../../l10n/app_localizations.dart';
import '../widgets/section_wrapper.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final l10n = context.l10n;

    return SectionWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.t('experience_title'),
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          ...experiences.map(
            (item) => Container(
              margin: const EdgeInsets.only(bottom: 18),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: BorderDirectional(
                  start: BorderSide(color: Theme.of(context).colorScheme.primary, width: 3),
                ),
                color: Theme.of(context).colorScheme.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.company, style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 4),
                  Text(item.title.of(locale)),
                  const SizedBox(height: 2),
                  Text(item.period.of(locale), style: Theme.of(context).textTheme.bodySmall),
                  const SizedBox(height: 8),
                  Text(item.summary.of(locale)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
