import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import '../../utils/cv_actions.dart';
import '../widgets/animated_reveal.dart';
import '../widgets/section_wrapper.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key, required this.onNavigate});

  final ValueChanged<String> onNavigate;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return SectionWrapper(
      child: AnimatedReveal(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.t('hero_name'),
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
            ),
            const SizedBox(height: 14),
            Text(
              l10n.t('hero_title'),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 14),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 720),
              child: Text(
                l10n.t('hero_subtitle'),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const SizedBox(height: 28),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                FilledButton(
                  onPressed: () => onNavigate('projects'),
                  child: Text(l10n.t('view_projects')),
                ),
                OutlinedButton(
                  onPressed: openCvInNewTab,
                  child: Text(l10n.t('view_cv')),
                ),
                OutlinedButton(
                  onPressed: downloadCv,
                  child: Text(l10n.t('download_cv')),
                ),
                TextButton(
                  onPressed: () => onNavigate('contact'),
                  child: Text(l10n.t('contact_me')),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
