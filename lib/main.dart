import 'package:events_app/core/theme.dart';
import 'package:events_app/features/events/data/providers/theme_provider.dart';
import 'package:events_app/features/events/presentation/views/events_screen.dart';
import 'package:events_app/features/registration/presentation/views/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'firebase_options.dart';

final themeProvider = ChangeNotifierProvider<ThemeProvider>((ref) => ThemeProvider());

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeProvider theme = ref.watch(themeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Events App',
      theme: theme.themeData,
      // darkTheme: darkMode,
      home:
      FirebaseAuth.instance.currentUser == null ?
      const RegisterScreen()
          :
      EventsScreen(),
    );
  }
}