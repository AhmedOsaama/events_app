import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events_app/core/firebase_utils.dart';
import 'package:events_app/core/widgets/sizedbox_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../core/app_colors.dart';
import '../../../../../core/style_utils.dart';
import '../../../../../core/validator.dart';
import '../../../../../core/widgets/generic_button.dart';
import '../../../../../core/widgets/generic_text_field.dart';

class AddEventsScreenBody extends StatefulWidget {
  const AddEventsScreenBody({Key? key}) : super(key: key);

  @override
  State<AddEventsScreenBody> createState() => _AddEventsScreenBodyState();
}

class _AddEventsScreenBodyState extends State<AddEventsScreenBody> {
  final _formKey = GlobalKey<FormState>();
  String _eventType = "";
  String _date = "";
  String _location = "";
  String _description = "";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              70.h,
              Text(
                "Event Type",
                style: TextStyles.textViewBold12,
              ),
              10.h,
              GenericField(
                hintText: "e.g. Wedding Event",
                onSaved: (value){
                  _eventType = value!;
                },
                boxShadow: null,
                validation: (value) => Validator.text(value),
              ),
              20.h,
              Text(
                "Date",
                style: TextStyles.textViewBold12,
              ),
              10.h,
              GenericField(
                hintText: "e.g. 11/11/2019",
                onSaved: (value){
                  _date = value!;
                },
                validation: (value) => Validator.text(value),
              ),
              10.h,
              Text(
                "Location",
                style: TextStyles.textViewBold12,
              ),
              10.h,
              GenericField(
                hintText: "e.g pyramid gardens - first gate",
                onSaved: (value){
                  _location = value!;
                },
                validation: (value) => Validator.text(value),
              ),
              20.h,
              Text(
                "Description",
                style: TextStyles.textViewBold12,
              ),
              10.h,
              GenericField(
                hintText: "Event description",
                maxLines: 5,
                onSaved: (value){
                  _description = value!;
                },
                validation: (value) => Validator.text(value),
              ),
              30.h,
              GenericButton(
                onPressed: () {
                  var isValid = _formKey.currentState?.validate();
                  if(isValid!) {
                    _formKey.currentState!.save();
                    addEvent();
                  }
                },
                width: double.infinity,
                height: 60,
                borderRadius: BorderRadius.circular(6),
                color: brightOrange,
                child: Text(
                  "Add Event",
                  style:
                  TextStyles.textViewSemiBold16.copyWith(color: Colors.white),
                ),
              ),
              20.h
            ],
          ),
        ),
      ),
    );
  }
  Future<void> addEvent() async {
    bool isValid = _formKey.currentState!.validate();
    try {
      if (isValid) {
        _formKey.currentState?.save();
        await FirestoreUtils.firestoreEventsCollection.add({
          "event_type": _eventType,
          "date": _date,
          "location": _location,
          "interested_people": 0,
          "description": _description,
        });
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Event added"),
        ));
        Navigator.of(context).pop();
      }
    } on FirebaseException catch(e){
      log("Couldn't add event: $e");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message.toString()),
        backgroundColor: Theme.of(context).colorScheme.error,
      ));
    }
  }
}
