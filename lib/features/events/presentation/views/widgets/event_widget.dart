import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events_app/core/firebase_utils.dart';
import 'package:events_app/core/widgets/sizedbox_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../core/style_utils.dart';
import '../../../data/models/Event.dart';

class EventWidget extends StatefulWidget {
  final Event event;
  final String eventId;
  const EventWidget({Key? key, required this.event, required this.eventId}) : super(key: key);

  @override
  State<EventWidget> createState() => _EventWidgetState();
}

class _EventWidgetState extends State<EventWidget> {
  bool _isInterested = false;

  @override
  Widget build(BuildContext context) {
    final event = widget.event;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          event.eventType!,
          style: TextStyles.textViewRegular16,
        ),
        10.h,
        Text(
          event.date!,
          style: TextStyles.textViewRegular14,
        ),
        10.h,
        Text(
          event.location!,
          style: TextStyles.textViewRegular14,
        ),
        Text(
          event.description!,
          style: TextStyles.textViewRegular14,
        ),
        20.h,
        Text(
          "Interested: ${event.interestedPeople}",
          style: TextStyles.textViewBold12,
        ),
        10.h,
        Row(
          children: [
            Text(
              "Are you interested ?",
              style: TextStyles.textViewRegular14,
            ),
            10.w,
            !_isInterested
                ? TextButton(
                    onPressed: () {
                      setState(() {
                        _isInterested = true;
                      });
                      FirestoreUtils.firestoreEventsCollection.doc(widget.eventId).update({
                        "interested_people": FieldValue.increment(1),
                      });
                    },
                    child: const Text("YES"))
                : const Icon(
                    Icons.check_box,
                    color: Colors.green,
                  ),
          ],
        )
      ],
    );
  }
}
