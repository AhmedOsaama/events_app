import 'package:events_app/core/widgets/sizedbox_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../core/style_utils.dart';

class EventWidget extends StatefulWidget {
  const EventWidget({Key? key}) : super(key: key);

  @override
  State<EventWidget> createState() => _EventWidgetState();
}

class _EventWidgetState extends State<EventWidget> {
  bool _isInterested = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Event type",
          style: TextStyles.textViewRegular16,
        ),
        10.h,
        Text(
          "15/10/2023",
          style: TextStyles.textViewRegular14,
        ),
        10.h,
        Text(
          "This is the description of the event",
          style: TextStyles.textViewRegular14,
        ),
        20.h,
        Text(
          "Interested: 8 People",
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
