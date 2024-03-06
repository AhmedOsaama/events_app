/// event_type : "Wedding"
/// date : "11/11/2019"
/// location : "First gate - pyramid gardens"
/// description : "Event description"

class Event {
  Event({
      String? eventType, 
      String? date, 
      String? location, 
      int? interestedPeople,
      String? description,}){
    _eventType = eventType;
    _date = date;
    _location = location;
    _interestedPeople = interestedPeople;
    _description = description;
}

  Event.fromJson(dynamic json) {
    _eventType = json['event_type'];
    _date = json['date'];
    _location = json['location'];
    _interestedPeople = json['interested_people'];
    _description = json['description'];
  }
  String? _eventType;
  String? _date;
  String? _location;
  int? _interestedPeople;
  String? _description;
Event copyWith({  String? eventType,
  String? date,
  String? location,
  int? interestedPeople,
  String? description,
}) => Event(  eventType: eventType ?? _eventType,
  date: date ?? _date,
  location: location ?? _location,
  interestedPeople: interestedPeople ?? _interestedPeople,
  description: description ?? _description,
);
  String? get eventType => _eventType;
  String? get date => _date;
  String? get location => _location;
  int? get interestedPeople => _interestedPeople;
  String? get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['event_type'] = _eventType;
    map['date'] = _date;
    map['location'] = _location;
    map['description'] = _description;
    return map;
  }

}