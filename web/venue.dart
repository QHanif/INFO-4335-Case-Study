import 'dart:html';
import 'dart:core';

//qoys & saufi

class Venue {
  String _venue;
  String _key;
  DateTime _dateTime;
  String _progName;
  Map<String, bool>
      reserved; //key is venue+name+date+time, bool is the availability

  Venue(var reserved1)
      : _venue = '',
        _key = '',
        _progName = '',
        _dateTime = DateTime.now(),
        reserved = reserved1;

//zaidi

  void reserveVenue(String venue, String date, String time, String progName) {
    _venue = venue; //get venue
<<<<<<< Updated upstream
    _key = '$venue-$date-$time'; //combine venue, date and time as key
=======
    _progName = progName; //get programme name
    _key = '$venue;$date;$time;$progName'; //combine venue, date and time as key
>>>>>>> Stashed changes
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

<<<<<<< Updated upstream
    if (reservations.containsKey(dateTime)) {
      return false; //Venue dah di book
    }

    return true; //kalau takde reservation
=======
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
//qoys & azhad
  void printReservedTable() {
    Element? outputDiv = querySelector('#records');
    outputDiv?.text = reserved.toString();
    // Clear the previous content of the output div
    outputDiv?.innerHtml = '';

    // Create a table element
    var table = TableElement();
    table.style.border = '1px solid black';

    // Create table header
    var headerRow = table.createTHead().insertRow(0);

    headerRow.addCell()
      ..text = 'Venue'
      ..style.border = '1px solid black';
    headerRow.addCell()
      ..text = 'Date'
      ..style.border = '1px solid black';
    headerRow.addCell()
      ..text = 'Time'
      ..style.border = '1px solid black';
    headerRow.addCell()
      ..text = 'Programme Name'
      ..style.border = '1px solid black';

    // Populate the table with reserved venues
    reserved.forEach((key, status) {
      var row = table.createTBody().addRow();
      var keyParts = key.split(';');

      // Set borders for each cell
      row.addCell()
        ..text = keyParts[0]
        ..style.border = '1px solid black'; // Venue cell border

      row.addCell()
        ..text = keyParts[1]
        ..style.border = '1px solid black'; // Date cell border

      row.addCell()
        ..text = keyParts[2]
        ..style.border = '1px solid black'; // Time cell border

      row.addCell()
        ..text = keyParts[3]
        ..style.border = '1px solid black'; // Programme Name cell border

      // Add a delete button to the row
      var deleteButton = ButtonElement()
        ..text = 'Delete'
        ..style.border = '1px solid black'
        ..style.borderRadius = '5px'
        ..onClick.listen((event) {
          // Remove the row from the table
          row.remove();

          // Remove the venue from the reserved map
          reserved.remove(key);
        });

      // Add the delete button to a new cell in the row
      row.addCell().children.add(deleteButton);
    });

    // Append the table to the output div
    outputDiv?.append(table);
>>>>>>> Stashed changes
  }

  void makeReservation(DateTime dateTime, String details) {
    //buat reservation
    reservations[dateTime] = details;
    isAvailable = false;
  }
  */
}
