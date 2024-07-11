import 'package:dio/dio.dart';

import 'dio_native.dart' if (dart.library.html) 'dio_browser.dart';

class DioRestClient extends BaseDio {
  DioRestClient()
      : super(
          BaseOptions(
            connectTimeout: const Duration(seconds: 10),
          ),
        );
}
