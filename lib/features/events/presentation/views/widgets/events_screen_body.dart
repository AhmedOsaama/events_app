import 'package:events_app/core/style_utils.dart';
import 'package:events_app/core/widgets/sizedbox_extension.dart';
import 'package:events_app/features/events/presentation/views/widgets/event_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../core/app_colors.dart';

class EventsScreenBody extends StatelessWidget {
  EventsScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(        //TODO: wrap with a stream of events
      physics: const BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (ctx, i) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(color: shadowColor, blurRadius: 28, offset: Offset(0, 10)),
          ],
        ),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: EventWidget(),
        ),
      ),
    );
  }
}
