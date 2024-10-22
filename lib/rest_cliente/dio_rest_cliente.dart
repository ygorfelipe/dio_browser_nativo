import 'package:dio/dio.dart';
//* iremos decider qual sera utilizado, é no momento da compilação que era realmente sera feito
//! se existir a lib html ele prioriza o broser, caso ao contrario ele pegara  native
import 'dio_native.dart' if (dart.library.html) 'dio_browser.dart';

class DioRestCliente extends BaseDio {
  DioRestCliente()
      : super(BaseOptions(
          connectTimeout: const Duration(seconds: 10),
        ));
}
