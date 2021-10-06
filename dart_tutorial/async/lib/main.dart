import 'dart:io';

const oneSecond = Duration(seconds: 1);


Future<int> printWithDelay(String message) async {
  await Future.delayed(oneSecond);
  print(message);
  return 1;
}
Future<void> printWithDelay2(String message) async {
  await Future.delayed(oneSecond);
  print(message);
}


Future<void> printWithDelay3(String message) {
  //then이라는 함수 안에 또 함수를 정의해 파라미터로 넘긴 것(재사용하지 않아서 _로 작성)
  return Future.delayed(oneSecond).then((_) {
    print(message);
  });
}

Future<void> createDescriptions(Iterable<String> objects) async {
  for (var object in objects) {
    try {
      var file = File('$object.txt');
      if (await file.exists()) { //boolean 값 리턴
      //file을 생성하거나 불러오는 작업은 시간이 걸리는 일이 많으니
      //이렇게 비동기로 처리하곤 한다
        var modified = await file.lastModified();
        print(
            'File for $object already exists. It was modified on $modified.');
        continue;
      }
      await file.create();
      await file.writeAsString('Start describing $object in this file.');
    } on IOException catch (e) {
      print('Cannot create description for $object: $e');
    }
  }
}
void main() async{
  print(printWithDelay('바로 출력'));
  //위처럼 하면 return값인 1은 꺼낼 수 없다
  //1을 꺼내려면 별도의 작업을 해주어야 하는데 이때 await가 필요하다
  //await와 Future가 만나면 특정 리턴값을 반환한다
  //Future가 자바스크립트의 Promise에 대응한다고 생각하면 쉬울 것
  int result = await printWithDelay('출력');
  print(result);
  
}