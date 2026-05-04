import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import '../widgets/section_wrapper.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final primary = Theme.of(context).colorScheme.primary;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            primary.withOpacity(0.1),
            Theme.of(context).colorScheme.surfaceContainerLowest,
          ],
        ),
      ),
      child: SectionWrapper(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.favorite_rounded, size: 14, color: primary),
                const SizedBox(width: 6),
                Text(
                  l10n.t('footer_text'),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.6),
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
