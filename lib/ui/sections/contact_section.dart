import 'package:flutter/material.dart';

import '../../data/portfolio_data.dart';
import '../../l10n/app_localizations.dart';
import '../../utils/link_utils.dart';
import '../widgets/section_wrapper.dart';
import '../widgets/section_title.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final isCompact = MediaQuery.sizeOf(context).width < 900;
    final primary = Theme.of(context).colorScheme.primary;

    return SectionWrapper(
      background: Theme.of(context).colorScheme.surfaceContainerLowest,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: l10n.t('contact_title')),
          const SizedBox(height: 24),
          Flex(
            direction: isCompact ? Axis.vertical : Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: l10n.t('contact_name'),
                          prefixIcon: const Icon(Icons.person_outline_rounded),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                          filled: true,
                        ),
                        validator: (value) =>
                            value == null || value.trim().isEmpty
                                ? l10n.t('required_field')
                                : null,
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: l10n.t('contact_email'),
                          prefixIcon: const Icon(Icons.email_outlined),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                          filled: true,
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty)
                            return l10n.t('required_field');
                          final emailRegex =
                              RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
                          return emailRegex.hasMatch(value)
                              ? null
                              : l10n.t('invalid_email');
                        },
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _messageController,
                        minLines: 4,
                        maxLines: 6,
                        decoration: InputDecoration(
                          labelText: l10n.t('contact_message'),
                          alignLabelWithHint: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                          filled: true,
                        ),
                        validator: (value) =>
                            value == null || value.trim().isEmpty
                                ? l10n.t('required_field')
                                : null,
                      ),
                      const SizedBox(height: 16),
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: FilledButton.icon(
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(l10n.t('contact_success')),
                                  behavior: SnackBarBehavior.floating,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              );
                            }
                          },
                          icon: const Icon(Icons.send_rounded, size: 17),
                          label: Text(l10n.t('contact_send')),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                  width: isCompact ? 0 : 40, height: isCompact ? 28 : 0),
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: primary.withOpacity(0.06),
                    borderRadius: BorderRadius.circular(16),
                    border:
                        Border.all(color: primary.withOpacity(0.18)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.t('find_me_on'),
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 16),
                      _SocialRow(
                        icon: Icons.code_rounded,
                        label: l10n.t('social_github'),
                        url: socialLinks['github']!,
                        color: primary,
                      ),
                      const SizedBox(height: 10),
                      _SocialRow(
                        icon: Icons.business_center_outlined,
                        label: l10n.t('social_linkedin'),
                        url: socialLinks['linkedin']!,
                        color: const Color(0xFF0077B5),
                      ),
                      const SizedBox(height: 10),
                      _SocialRow(
                        icon: Icons.email_outlined,
                        label: l10n.t('social_email'),
                        url: socialLinks['email']!,
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SocialRow extends StatefulWidget {
  const _SocialRow({
    required this.icon,
    required this.label,
    required this.url,
    required this.color,
  });
  final IconData icon;
  final String label;
  final String url;
  final Color color;

  @override
  State<_SocialRow> createState() => _SocialRowState();
}

class _SocialRowState extends State<_SocialRow> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => openExternalLink(widget.url),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: _hovered
                ? widget.color.withOpacity(0.12)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: _hovered
                  ? widget.color.withOpacity(0.5)
                  : Colors.transparent,
            ),
          ),
          child: Row(
            children: [
              Icon(widget.icon, size: 20, color: widget.color),
              const SizedBox(width: 10),
              Text(
                widget.label,
                style: TextStyle(
                  color: widget.color,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 12,
                color: widget.color.withOpacity(0.6),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
