import 'package:flutter/material.dart';

import '../../data/portfolio_data.dart';
import '../../l10n/app_localizations.dart';
import '../../models/portfolio_models.dart';
import '../../utils/app_icon_service.dart';
import '../../utils/link_utils.dart';
import '../widgets/section_wrapper.dart';
import '../widgets/section_title.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final isCompact = MediaQuery.sizeOf(context).width < 900;

    return SectionWrapper(
      background: Theme.of(context).colorScheme.surfaceContainerLowest,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: l10n.t('projects_title')),
          const SizedBox(height: 24),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: projects.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isCompact ? 1 : 2,
              mainAxisExtent: 390,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
            ),
            itemBuilder: (context, index) => _ProjectCard(project: projects[index]),
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  const _ProjectCard({required this.project});

  final ProjectItem project;

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final l10n = context.l10n;
    final primary = Theme.of(context).colorScheme.primary;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        transform: Matrix4.translationValues(0, _hovered ? -6 : 0, 0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _hovered
                ? primary
                : Theme.of(context).dividerColor.withOpacity(0.25),
            width: _hovered ? 1.5 : 1,
          ),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: primary.withOpacity(0.18),
                    blurRadius: 24,
                    offset: const Offset(0, 12),
                  )
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  )
                ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Image / icon strip ──────────────────────────────────────
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              child: _AppImageBanner(project: widget.project, primary: primary),
            ),
            // ── Card body ───────────────────────────────────────────────
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.project.title.of(locale),
                      style: Theme.of(context).textTheme.titleLarge,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      widget.project.description.of(locale),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.7),
                          ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      widget.project.impact.of(locale),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: primary.withOpacity(0.85),
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: widget.project.techStack
                          .take(4)
                          .map(
                            (tech) => Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                color: primary.withOpacity(0.08),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color: primary.withOpacity(0.2)),
                              ),
                              child: Text(
                                tech,
                                style: TextStyle(
                                  fontSize: 11,
                                  color: primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    const Spacer(),
                    // ── Store buttons ───────────────────────────────────
                    Row(
                      children: [
                        if (widget.project.appStoreUrl != null)
                          _StoreBadge(
                            label: l10n.t('project_app_store'),
                            icon: Icons.apple_rounded,
                            url: widget.project.appStoreUrl!,
                            color: primary,
                          ),
                        if (widget.project.playStoreUrl != null)
                          _StoreBadge(
                            label: l10n.t('project_play_store'),
                            icon: Icons.android_rounded,
                            url: widget.project.playStoreUrl!,
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                        if (widget.project.githubUrl != null)
                          _StoreBadge(
                            label: l10n.t('project_github'),
                            icon: Icons.code_rounded,
                            url: widget.project.githubUrl!,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        if (widget.project.demoUrl != null)
                          _StoreBadge(
                            label: l10n.t('project_demo'),
                            icon: Icons.open_in_new_rounded,
                            url: widget.project.demoUrl!,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Displays app artwork fetched from the iTunes API, with a branded fallback.
class _AppImageBanner extends StatefulWidget {
  const _AppImageBanner({required this.project, required this.primary});
  final ProjectItem project;
  final Color primary;

  @override
  State<_AppImageBanner> createState() => _AppImageBannerState();
}

class _AppImageBannerState extends State<_AppImageBanner> {
  String? _artworkUrl;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    // Prefer manual override; otherwise fetch from iTunes if available.
    if (widget.project.imageUrl != null) {
      setState(() {
        _artworkUrl = widget.project.imageUrl;
        _loading = false;
      });
      return;
    }
    if (widget.project.appStoreUrl != null) {
      final url = await fetchItunesArtwork(widget.project.appStoreUrl!);
      if (mounted) setState(() {
        _artworkUrl = url;
        _loading = false;
      });
    } else {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    const bannerHeight = 130.0;

    if (_loading) {
      return Container(
        height: bannerHeight,
        color: Theme.of(context).colorScheme.surfaceContainer,
        child: const Center(
          child: SizedBox(
            width: 28,
            height: 28,
            child: CircularProgressIndicator(strokeWidth: 2.5),
          ),
        ),
      );
    }

    if (_artworkUrl != null) {
      return SizedBox(
        height: bannerHeight,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Blurred background tile
            Image.network(
              _artworkUrl!,
              fit: BoxFit.cover,
              color: Colors.black26,
              colorBlendMode: BlendMode.darken,
              errorBuilder: (_, __, ___) => _Placeholder(primary: widget.primary, height: bannerHeight),
            ),
            // Centred sharp app icon
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.network(
                  _artworkUrl!,
                  width: 88,
                  height: 88,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) =>
                      Icon(Icons.apps_rounded, size: 52, color: widget.primary),
                ),
              ),
            ),
          ],
        ),
      );
    }

    // Play Store-only or unknown app: branded placeholder.
    return _Placeholder(primary: widget.primary, height: bannerHeight);
  }
}

class _Placeholder extends StatelessWidget {
  const _Placeholder({required this.primary, required this.height});
  final Color primary;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: primary.withOpacity(0.07),
      alignment: Alignment.center,
      child: Icon(Icons.phone_android_rounded, size: 48, color: primary.withOpacity(0.4)),
    );
  }
}

class _StoreBadge extends StatelessWidget {
  const _StoreBadge({
    required this.label,
    required this.icon,
    required this.url,
    required this.color,
  });
  final String label;
  final IconData icon;
  final String url;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 6),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () => openExternalLink(url),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            border: Border.all(color: color.withOpacity(0.45)),
            borderRadius: BorderRadius.circular(8),
            color: color.withOpacity(0.07),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 14, color: color),
              const SizedBox(width: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: color,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
