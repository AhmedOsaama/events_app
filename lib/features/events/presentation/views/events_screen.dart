import 'package:events_app/features/events/presentation/views/add_events_screen.dart';
import 'package:events_app/features/events/presentation/views/widgets/events_screen_body.dart';
import 'package:flutter/material.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx) => const AddEventsScreen())
      ), child: const Icon(Icons.add),),
      appBar: AppBar(title: const Text("Events"),
      actions: [
        IconButton(onPressed: (){}, icon: const Icon(Icons.light_mode_rounded)),
      ],),
      body: EventsScreenBody(),
    );
  }
}
