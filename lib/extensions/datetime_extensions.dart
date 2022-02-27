part of 'extensions.dart';

extension DateTimeExtension on DateTime {
String get dateTime => "${this.day} - ${this.month} - ${this.year}";
}