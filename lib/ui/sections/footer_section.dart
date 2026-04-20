import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import '../widgets/section_wrapper.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SectionWrapper(
      child: Text(
        l10n.t('footer_text'),
        textAlign: TextAlign.center,
      ),
    );
  }
}
