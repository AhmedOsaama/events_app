import 'package:events_app/features/events/presentation/views/widgets/add_events_screen_body.dart';
import 'package:flutter/material.dart';

class AddEventsScreen extends StatelessWidget {
  const AddEventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AddEventsScreenBody(),
    );
  }
}
