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

    return Container(
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.95),
        border: Border(
          bottom: BorderSide(color: Theme.of(context).dividerColor.withOpacity(0.2)),
        ),
      ),
      child: Row(
        children: [
          Text(
            l10n.t('hero_name'),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const Spacer(),
          if (isMobile)
            PopupMenuButton<String>(
              tooltip: '',
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
              (item) => TextButton(
                onPressed: () => onNavigate(item.id),
                child: Text(
                  item.label,
                  style: TextStyle(
                    fontWeight:
                        activeId == item.id ? FontWeight.bold : FontWeight.normal,
                    color: activeId == item.id
                        ? Theme.of(context).colorScheme.primary
                        : null,
                  ),
                ),
              ),
            ),
          const SizedBox(width: 12),
          TextButton(
            onPressed: onToggleLanguage,
            child: Text(l10n.t('language_toggle')),
          ),
          IconButton(
            tooltip: l10n.t('theme_toggle'),
            onPressed: onToggleTheme,
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
          ),
        ],
      ),
    );
  }
}
