import 'random.dart';

List<String> prefixes = [
  'Go',
  'Klik',
  'Ayo',
  'Mari',
  'Oke',
  'Siap',
  'Halo',
  'Beli',
  'nge',
  'Ruang',
  'Si',
];

List<String> postfixes = [
  '.in',
  '.id',
  '.com',
  '.io',
  'an',
  'pedia',
  'loka',
  'online',
  'bagus',
];

List<List<String>> mispells = [
  /* Repetition */
  ['a', 'aa'],
  ['i', 'ii'],
  ['u', 'uu'],
  ['e', 'ee'],
  ['o', 'oo'],
  ['b', 'bb'],
  ['c', 'cc'],
  ['d', 'dd'],
  ['f', 'ff'],
  ['g', 'gg'],
  ['h', 'hh'],
  ['j', 'jj'],
  ['k', 'kk'],
  ['l', 'll'],
  ['m', 'mm'],
  ['n', 'nn'],
  ['o', 'oo'],
  ['p', 'pp'],
  ['q', 'qq'],
  ['r', 'rr'],
  ['s', 'ss'],
  ['t', 'tt'],
  ['v', 'vv'],
  ['w', 'ww'],
  ['x', 'xx'],
  ['y', 'yy'],
  ['z', 'zz'],

  /* Deletion */
  ['a', ''],
  ['i', ''],
  ['u', ''],
  ['e', ''],
  ['o', ''],

  /* Exageration */
  ['a', 'ua'],
  ['i', 'y'],
  ['i', 'ee'],
  ['u', 'oo'],
  ['e', 'ay'],
  ['o', 'wo'],

  /* Mispell */
  ['b', 'bh'],
  ['c', 'k'],
  ['c', 'tj'],
  ['d', 'dh'],
  ['f', 'p'],
  ['f', 'v'],
  ['g', 'gh'],
  ['g', 'k'],
  ['h', 'hy'],
  ['j', 'dj'],
  ['k', 'c'],
  ['k', 'q'],
  ['l', 'r'],
  ['l', 'll'],
  ['m', 'mm'],
  ['n', 'nd'],
  ['n', 'nt'],
  ['p', 'f'],
  ['p', 'v'],
  ['q', 'k'],
  ['r', 'l'],
  ['s', 'sh'],
  ['s', 'z'],
  ['t', 'th'],
  ['v', 'f'],
  ['v', 'p'],
  ['w', 'u'],
  ['w', 'vv'],
  ['x', 'ks'],
  ['x', 'ques'],
  ['y', 'j'],
  ['y', 'i'],
  ['z', 's'],
  ['z', 'sh'],
  [' ', ''],
];

List<Function(String)> _generators = [
  _prefixGenerator,
  _postfixGenerator,
  _mispellGenerator
];

String _prefixGenerator(String text) {
  return randomString(prefixes) + text;
}

String _postfixGenerator(String text) {
  return text + randomString(postfixes);
}

String _mispellGenerator(String text) {
  int index = randomInt(text.length);
  String char = text[index];
  List<List<String>> availableMispells =
      mispells.where((mispell) => mispell[0] == char).toList();
  List<String> choosenMispell =
      availableMispells[randomInt(availableMispells.length)];
  return text.replaceRange(index, index + 1, choosenMispell[1]);
}

/// Return given text to a typical startup name.
String generateName(String text) {
  Function generator = randomChoice(_generators);
  return generator(text);
}

// void _debug() {
//   print(generateName('toko'));
// }

// void main(List<String> args) => _debug();
