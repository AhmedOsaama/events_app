import 'package:events_app/core/theme.dart';
import 'package:events_app/features/events/data/providers/theme_provider.dart';
import 'package:events_app/features/events/presentation/views/add_events_screen.dart';
import 'package:events_app/features/events/presentation/views/widgets/events_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../main.dart';

class EventsScreen extends ConsumerWidget {
  EventsScreen({Key? key}) : super(key: key);
  // final themeProvider = Provider<ThemeProvider>((ref) => ThemeProvider());
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const AddEventsScreen())),
        child: const Icon(Icons.add),

      ),
      appBar: AppBar(
        title: const Text("Events"),
        actions: [
          IconButton(
              onPressed: () {
                theme.toggleTheme();
              },
              icon: Icon(theme.themeData == lightMode ? Icons.light_mode_rounded : Icons.dark_mode_rounded)),
        ],
      ),
      body: EventsScreenBody(),
    );
  }
}
