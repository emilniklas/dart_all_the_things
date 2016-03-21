import 'dart:html';
import 'dart:convert' show JSON;

main() async {
  final mount = querySelector('#mount');

  final List heroes = await HttpRequest
    .getString('/heroes')
    .then(JSON.decode);
  mount.children.clear();

  heroes.map((hero) => new LIElement()
    ..text = '${hero["name"]}, aka ${hero["alias"]}'
  ).forEach(mount.append);
}
