import 'package:firebase_database/firebase_database.dart';

class OmbreData {
  String _name;
  String _imageUrl;
  String _time;
  String _message;

  OmbreData(this._name, this._imageUrl, this._message, this._time);

  // Getters
  String get name => this._name;
  String get imageUrl => this._imageUrl;
  String get time => this._time;
  String get message => this._message;

  // Setters
  set name(String name) {
    this._name = name;
  }

  set imageUrl(String imageUrl) {
    this._imageUrl = imageUrl;
  }

  set time(String time) {
    this._time = time;
  }

  set message(String message) {
    this._message = message;
  }

  OmbreData.fromSnapshot(DataSnapshot snapshot) {
    this._name = snapshot.value['name'];
    this._message = snapshot.value['message'];
    this._imageUrl = snapshot.value['imageUrl'];
    this._time = snapshot.value['time'];
  }

  Map<String, dynamic> toJson() {
    return {
      "name": _name,
      "message": _message,
      "time": _time,
      "imageUrl": _imageUrl
    };
  }
}
