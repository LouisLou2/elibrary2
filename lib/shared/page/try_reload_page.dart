import 'package:flutter/material.dart';

import '../../common/app_strings.dart';
import '../../style/ui_size.dart';

class TryReloadPage extends StatelessWidget {

  final String? title;
  final String? subtitle;
  final void Function() onReload;

  const TryReloadPage({
    super.key,
    required this.onReload,
    this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (title != null)
              Text(
                title!,
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
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
        shape: const CircleBorder(),
        onPressed: (){
          Navigator.of(context).pop();
        },
        child: const Icon(
          Icons.arrow_back_ios_rounded,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    );
  }
}