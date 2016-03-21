import 'package:embla/http.dart';
export 'package:embla/bootstrap.dart';
import 'package:embla/http_basic_middleware.dart';

get embla => [
  new HttpBootstrapper(
    pipeline: pipe(
      Route.get('heroes', () => [
        {"name": "Superman", "alias": "Man of Steel"},
        {"name": "Batmanz", "alias": "Dark Knight"},
      ]),
      PubMiddleware
    )
  )
];
