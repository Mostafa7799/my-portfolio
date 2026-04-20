import 'package:flutter/material.dart';

import '../../data/portfolio_data.dart';
import '../../l10n/app_localizations.dart';
import '../../utils/link_utils.dart';
import '../widgets/section_wrapper.dart';

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

    return SectionWrapper(
      background: Theme.of(context).colorScheme.surfaceContainerLowest,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.t('contact_title'),
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
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
                        decoration: InputDecoration(labelText: l10n.t('contact_name')),
                        validator: (value) =>
                            value == null || value.trim().isEmpty ? l10n.t('required_field') : null,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(labelText: l10n.t('contact_email')),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) return l10n.t('required_field');
                          final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
                          return emailRegex.hasMatch(value) ? null : l10n.t('invalid_email');
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _messageController,
                        minLines: 4,
                        maxLines: 6,
                        decoration: InputDecoration(labelText: l10n.t('contact_message')),
                        validator: (value) =>
                            value == null || value.trim().isEmpty ? l10n.t('required_field') : null,
                      ),
                      const SizedBox(height: 14),
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: FilledButton(
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(content: Text(l10n.t('contact_success'))));
                            }
                          },
                          child: Text(l10n.t('contact_send')),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: isCompact ? 0 : 32, height: isCompact ? 20 : 0),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton.icon(
                      onPressed: () => openExternalLink(socialLinks['github']!),
                      icon: const Icon(Icons.code),
                      label: Text(l10n.t('social_github')),
                    ),
                    TextButton.icon(
                      onPressed: () => openExternalLink(socialLinks['linkedin']!),
                      icon: const Icon(Icons.business_center),
                      label: Text(l10n.t('social_linkedin')),
                    ),
                    TextButton.icon(
                      onPressed: () => openExternalLink(socialLinks['email']!),
                      icon: const Icon(Icons.email_outlined),
                      label: Text(l10n.t('social_email')),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
