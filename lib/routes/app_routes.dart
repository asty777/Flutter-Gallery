part of 'app_pages.dart';

abstract class Routes {
  static const listPage = _Paths.listPage;
  static const detailPage = _Paths.detailPage;
}

abstract class _Paths {
  static const listPage = '/list';
  static const detailPage = '/detail';
}