import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events_app/core/firebase_utils.dart';
import 'package:events_app/core/style_utils.dart';
import 'package:events_app/core/widgets/sizedbox_extension.dart';
import 'package:events_app/features/events/presentation/views/widgets/event_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../core/app_colors.dart';
import '../../../data/models/Event.dart';

class EventsScreenBody extends StatelessWidget {
  EventsScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Object>>(
      stream: FirestoreUtils.firestoreEventsCollection.snapshots(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator(),);
        }
        if(!snapshot.hasData) {
          return Center(child: Text("There are no events. Add some!", style: TextStyles.textViewRegular14,),);
        }
        final events = snapshot.data?.docs ?? [];
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: events.length,
          itemBuilder: (ctx, i) {
            final event = Event.fromJson(events[i]);
            final eventId = events[i].id;
            return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(color: shadowColor, blurRadius: 28, offset: Offset(0, 10)),
              ],
            ),
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: EventWidget(event: event, eventId: eventId,),
            ),
          );
          },
        );
      }
    );
  }
}
