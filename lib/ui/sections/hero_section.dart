import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import '../../utils/cv_actions.dart';
import '../../utils/link_utils.dart';
import '../../data/portfolio_data.dart';
import '../widgets/animated_reveal.dart';
import '../widgets/section_wrapper.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key, required this.onNavigate});

  final ValueChanged<String> onNavigate;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final isWide = MediaQuery.sizeOf(context).width >= 900;
    final primary = Theme.of(context).colorScheme.primary;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.primaryContainer.withOpacity(0.35),
            Theme.of(context).scaffoldBackgroundColor,
          ],
        ),
      ),
      child: SectionWrapper(
        child: AnimatedReveal(
          child: isWide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: _HeroContent(
                          l10n: l10n, onNavigate: onNavigate, primary: primary),
                    ),
                    const SizedBox(width: 48),
                    _HeroAvatar(primary: primary),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _HeroAvatar(primary: primary),
                    const SizedBox(height: 28),
                    _HeroContent(
                        l10n: l10n, onNavigate: onNavigate, primary: primary),
                  ],
                ),
        ),
      ),
    );
  }
}

class _HeroAvatar extends StatelessWidget {
  const _HeroAvatar({required this.primary});
  final Color primary;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            primary.withOpacity(0.18),
            primary.withOpacity(0.06),
          ],
        ),
        border: Border.all(color: primary.withOpacity(0.35), width: 3),
      ),
      child: Icon(Icons.person, size: 96, color: primary.withOpacity(0.55)),
    );
  }
}

class _HeroContent extends StatelessWidget {
  const _HeroContent({
    required this.l10n,
    required this.onNavigate,
    required this.primary,
  });
  final AppLocalizations l10n;
  final ValueChanged<String> onNavigate;
  final Color primary;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          decoration: BoxDecoration(
            color: primary.withOpacity(0.12),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.code_rounded, size: 14, color: primary),
              const SizedBox(width: 6),
              Text(
                l10n.t('hero_title'),
                style: TextStyle(
                  color: primary,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          l10n.t('hero_name'),
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.w800,
              ),
        ),
        const SizedBox(height: 12),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Text(
            l10n.t('hero_subtitle'),
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withOpacity(0.72),
                ),
          ),
        ),
        const SizedBox(height: 28),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            FilledButton.icon(
              onPressed: () => onNavigate('projects'),
              icon: const Icon(Icons.rocket_launch_rounded, size: 17),
              label: Text(l10n.t('view_projects')),
            ),
            OutlinedButton.icon(
              onPressed: openCvInNewTab,
              icon: const Icon(Icons.description_outlined, size: 17),
              label: Text(l10n.t('view_cv')),
            ),
            OutlinedButton.icon(
              onPressed: downloadCv,
              icon: const Icon(Icons.download_rounded, size: 17),
              label: Text(l10n.t('download_cv')),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            _SocialIconBtn(
              tooltip: 'GitHub',
              icon: Icons.code,
              url: socialLinks['github']!,
            ),
            _SocialIconBtn(
              tooltip: 'LinkedIn',
              icon: Icons.business_center_outlined,
              url: socialLinks['linkedin']!,
            ),
            _SocialIconBtn(
              tooltip: 'Email',
              icon: Icons.email_outlined,
              url: socialLinks['email']!,
            ),
          ],
        ),
      ],
    );
  }
}

class _SocialIconBtn extends StatelessWidget {
  const _SocialIconBtn({
    required this.tooltip,
    required this.icon,
    required this.url,
  });
  final String tooltip;
  final IconData icon;
  final String url;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    return Tooltip(
      message: tooltip,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () => openExternalLink(url),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Icon(icon, size: 22, color: primary),
        ),
      ),
    );
  }
}
