import 'package:elibapp/common/app_strings.dart';
import 'package:elibapp/style/ui_size.dart';
import 'package:flutter/material.dart';

class ReloadWidget extends StatelessWidget {

  final VoidCallback onReload;
  final String? tile;
  final String? subtitle;
  const ReloadWidget({
    super.key,
    required this.onReload,
    this.tile,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {

    ThemeData theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (tile != null)
          Text(
            tile!,
            style: theme.textTheme.titleMedium?.copyWith(
              fontSize: 22,
            ),
          ),
        SizedBox(height: UiSize.gap.smallGap),
        if (subtitle != null)
          Text(
            subtitle!,
            style: theme.textTheme.labelLarge?.copyWith(
              color: theme.hintColor,
              fontSize: 16,
            ),
          ),
        SizedBox(height: UiSize.gap.mediumGap),
        FilledButton(
          onPressed: onReload,
          style: FilledButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          child: Text(
            AppStrs.retry,
            style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant),
          ),
        ),
      ],
    );
  }
}