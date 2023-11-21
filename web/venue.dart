import 'dart:html';
import 'dart:core';

class Venue {
  String _venue;
  String _key;
  DateTime _dateTime;
  Map<String, bool> reserved; //key is venue+date+time, bool is the availability

  Venue(var reserved1)
      : _venue = '',
        _key = '',
        _dateTime = DateTime.now(),
        reserved = reserved1;

  void reserveVenue(String venue, String date, String time) {
    _venue = venue; //get venue
    _key = '$venue-$date-$time'; //combine venue, date and time as key
    _dateTime = DateTime.parse('$date $time'); //format to datetime

    if (reserved.containsKey(_key) && reserved[_key] == true) {
      querySelector('#output')?.text =
          'Venue is not available. Please choose another room or another time'; //already booked
    } else if (_dateTime.isBefore(DateTime.now())) {
      querySelector('#output')?.text =
          'Please choose a date and time in the future'; //if datetime is before today
    } else {
      reserved[_key] = true;
      querySelector('#output')?.text =
          'Successfully booked venue $_venue at $_dateTime';
    }
  }

  void printReservedMap() {
    Element? record = querySelector('#record');
    record?.text = reserved.toString();
  }
  /*bool checkAvailability(DateTime dateTime) {
    if (!isAvailable) return false;
    //check kalaau venue tu dah di book

    if (reservations.containsKey(dateTime)) {
      return false; //Venue dah di book
    }

    return true; //kalau takde reservation
  }

  void makeReservation(DateTime dateTime, String details) {
    //buat reservation
    reservations[dateTime] = details;
    isAvailable = false;
  }
  */
}
