import 'dart:html';
import 'venue.dart';

//azhad
void main() {
  Map<String, String> reserved = {};
  final ButtonElement submit = querySelector('#submit') as ButtonElement;
  submit.onClick.listen((event) {
    // Get the selected values they return as strings for some reason
    var venue = (querySelector('#venue') as SelectElement).value;
    var date = (querySelector('#date') as InputElement).value;
    var time = (querySelector('#time') as SelectElement).value;
    var progName = (querySelector('#progName') as InputElement).value;

    // Call the reserveVenue function in venue.dart passing the selected values
    Venue newBook = Venue(reserved);
    newBook.reserveVenue(venue!, date!, time!, progName!);
    newBook.printReservedTable();
    // newBook.printReservedMap();
  });

  // querySelector('#output')?.text = 'Your Dart app is running.';
}
