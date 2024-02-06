
part of 'app_pages.dart';
abstract class _Paths{
  _Paths._();
  static const dateTime = '/date-time';
  static const home = '/home';
  static const desireDetail = '/desire-detail';
}

abstract class Routes{
  Routes._();
  static const home = _Paths.home;
  static const dateTime = _Paths.dateTime;
  static const desireDetail = _Paths.desireDetail;
}