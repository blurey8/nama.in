import 'dart:math';

final _random = new Random();
Object randomChoice(List<Object> list) {
  return list[_random.nextInt(list.length)];
}

String randomString(List<String> list) {
  return randomChoice(list).toString();
}

int randomInt(int range) {
  return _random.nextInt(range);
}