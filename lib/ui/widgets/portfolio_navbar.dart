import 'dart:ui';

import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';

class NavItem {
  const NavItem({required this.id, required this.label});

  final String id;
  final String label;
}

class PortfolioNavbar extends StatelessWidget {
  const PortfolioNavbar({
    super.key,
    required this.items,
    required this.activeId,
    required this.onNavigate,
    required this.onToggleLanguage,
    required this.onToggleTheme,
    required this.isDark,
  });

  final List<NavItem> items;
  final String activeId;
  final ValueChanged<String> onNavigate;
  final VoidCallback onToggleLanguage;
  final VoidCallback onToggleTheme;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final isMobile = MediaQuery.sizeOf(context).width < 900;
    final primary = Theme.of(context).colorScheme.primary;

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
        child: Container(
          height: 68,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Theme.of(context)
                .scaffoldBackgroundColor
                .withOpacity(isDark ? 0.78 : 0.88),
            border: Border(
              bottom: BorderSide(
                  color: Theme.of(context).dividerColor.withOpacity(0.15)),
            ),
          ),
          child: Row(
            children: [
              // Logo / name
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'M',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    l10n.t('hero_name'),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
              const Spacer(),
              if (isMobile)
                PopupMenuButton<String>(
                  tooltip: '',
                  icon: const Icon(Icons.menu_rounded),
                  onSelected: onNavigate,
                  itemBuilder: (context) => items
                      .map((item) => PopupMenuItem(
                            value: item.id,
                            child: Text(item.label),
                          ))
                      .toList(),
                )
              else
                ...items.map(
                  (item) => _NavButton(
                    item: item,
                    isActive: activeId == item.id,
                    onTap: () => onNavigate(item.id),
                    primary: primary,
                  ),
                ),
              const SizedBox(width: 8),
              _LangButton(
                label: l10n.t('language_toggle'),
                onTap: onToggleLanguage,
              ),
              IconButton(
                tooltip: l10n.t('theme_toggle'),
                onPressed: onToggleTheme,
                icon: Icon(
                  isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavButton extends StatefulWidget {
  const _NavButton({
    required this.item,
    required this.isActive,
    required this.onTap,
    required this.primary,
  });
  final NavItem item;
  final bool isActive;
  final VoidCallback onTap;
  final Color primary;

  @override
  State<_NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<_NavButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final color = widget.isActive
        ? widget.primary
        : _hovered
            ? widget.primary.withOpacity(0.75)
            : Theme.of(context).colorScheme.onSurface.withOpacity(0.65);

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.item.label,
                style: TextStyle(
                  fontWeight: widget.isActive
                      ? FontWeight.w700
                      : FontWeight.w500,
                  color: color,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 2),
              AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                height: 2,
                width: widget.isActive ? 20 : 0,
                decoration: BoxDecoration(
                  color: widget.primary,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LangButton extends StatelessWidget {
  const _LangButton({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
      ),
    );
  }
}
