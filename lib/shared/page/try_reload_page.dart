import 'package:flutter/material.dart';

import '../../common/app_strings.dart';

class TryReloadPage extends StatelessWidget {
  final void Function(BuildContext con) onReload;

  const TryReloadPage({
    super.key,
    required this.onReload
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FilledButton(
          onPressed: () => onReload(context),
          style: FilledButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
          ),
          child: Text(
            AppStrs.retry,
            style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant),
          ),
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