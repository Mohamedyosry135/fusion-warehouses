import 'package:event/event.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
class NewAddressEventArgs extends EventArgs {
  LatLng? chosenLocation;
  String? chosenAddress;

  NewAddressEventArgs(this.chosenLocation, this.chosenAddress);
}

final newAddressValueChangedEvent = Event<NewAddressEventArgs>();

class MyAddressesChangedEvent extends EventArgs {
  MyAddressesChangedEvent();
}

final myAddressesChangedEvent = Event<MyAddressesChangedEvent>();

class SortValueEventArgs extends EventArgs {
  String? sortValue;

  SortValueEventArgs(this.sortValue);
}

final sortValueChangedEvent = Event<SortValueEventArgs>();
