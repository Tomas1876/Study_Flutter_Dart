import 'dart:math'; //Dart core library

import 'calculator.dart';
import 'class.dart';

void main(){
  //데이터 타입
  // bool === boolean
  bool visible = true; //값을 주지 않으면 null로 세팅
  print(visible);

  //int - 정수
  //단 나누기 연산자는 / 대신 ~/ 사용
  int number = 17 ~/ 4;
  print(number);

  //double - 소수
  //소수는 그대로 / 라는 나누기 연산자를 사용한다
  double pi = 3.14 / 2;
  print(pi);

  //String - 문자열
  //작은따옴표로 감싼다
  String str = '얍';
  print(str);

  //List
  List ages = [10, 11, 12];
  print(ages[0]);

  //Map - key:value
  Map person = {'key' : 'value', 'name' : '이가희', 'age' : 20 };
  print(person);

  //int라고 지정하지 않아도 아래처럼 선언하면 암묵적으로 int가 된다
  var year = 1977;
  print(year);

  //final == 변경 불가능한 상수
  final double pi2 = 3.14;
  //final pi2 = 3.14 라고 선언도 가능하다
  //pi2= 4.5;

  //const == final처럼 변경 불가능
  const pi3 = 3.14;
  print(pi3);

  //왜 굳이 변경 불가한 타입이 둘로 나뉘었느냐?
  //클래스에서 final은 처음에 선언만 하고 생성자를 통해
  //한 번은 값을 할당할 수 있다
  //그러나 const는 처음 선언할 때 할당을 해야 하고 그 이후로 할당이 불가하다
  //const의 경우 프로그램을 만들 때 값이 고정이 되고
  //final은 배포될 때 고정이 된다

  //조건문과 반복문
  int year2 = 1990;
  bool b = year2 >= 2000;
  if(b){
    print('참');
  } else{
    print('거짓');
  }

  for(int month = 1; month <= 12; month++){
    print(month);
  }
  List ages2 = [10,20,30];
  for(var age2 in ages2){
    print(age2);
  }  
  int year3 = 2010;
  while(year3 < 2016){
    year3 += 1;
  }

  //함수
  int add(int a, int b){
    return a + b;
  }
  print('===함수===');
  int result = add(1,2);
  print(result);

  int fibonacci(int n){
    if(n == 0 || n == 1) return n;
    return fibonacci(n-1) + fibonacci(n-2);
  }
  int fibo = fibonacci(2);
  print(fibo);

  //람다식
  List ages3 = [10,11,12];
  //where는 조건을 뜻한다
  var filterAges = ages3.where((age) => age > 10);
  filterAges.forEach(print);
  //위 두 줄은 아래와 같다
  ages3.where((age) => age>10).forEach(print);

  //Dart에서는 아래처럼 print 조차도 변수에 할당하고 넘겨줄 수 있다
  var p = print;

  var flybyObjects = ['abc', 'you', 'hello'];
  flybyObjects.where((str) => str.contains('y')).forEach(print);

  //import
  //다른 파일에 있는 함수 등을 가져오는 것
  int sum_v = sum(1,2);
  int mul = multiply(1, 2);
  print('더하기 결과값 : $sum_v, 곱하기 결과값 : $mul');

  Random random;

  //class.dart
  Person person_c = Person(20, '철수');
  person_c.study();
  Person person3 = Person.age(23);
  person3.study();

  Spacecraft spacecraft = Spacecraft('나루호', DateTime.now());
  print('이름 : ${spacecraft.name} 발사일 : ${spacecraft.launchDate}');
  print(spacecraft.launchYear);
  spacecraft.describe();

  Orbiter orbiter = Orbiter('나루호',DateTime.now(),100);
  orbiter.describe();

  //부모타입이 자식타입 인스턴스를 받고 둘 다 가지고 있는 함수를 호출할 경우
  //자식이 재정의한 함수가 호출된다
  Spacecraft sp = Orbiter('아폴로호', DateTime.now(), 200);
  sp.describe();

  PilotedCraft pc = PilotedCraft('홍길동', DateTime.now());
  pc.describe();
  pc.describeCrew();

  //implements
  MockSpaceship mcs = MockSpaceship(DateTime.now(), 'Mock');
  print(mcs.name);

  Unit unit = Unit();
  unit.describeWithEmphasis();

  
}

