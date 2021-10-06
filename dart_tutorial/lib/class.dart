class Person{
  int age = 0;
  String name = ' '; //할당 안 해도 에러가 안 나야하는데 나서 임시 조치
  /*
  Person(int age, String name){
    this.age = age;
    this.name = name;
  }
  */
  //위 주석처리된 생성자는 아래와 같이 생략하여 작성이 가능하다
  Person(this.age, this.name);

  //이름이 있는 생성자도 사용 가능
  Person.age(int age){
    this.age = age;
    this.name ='익명';
  }
  //역시 아래와 같이 축약이 가능하다
  //Person.age(int age) : this(age, '익명');

  void study(){
    print('$name is studdying');
  }
}
class Spacecraft{
    String name;
    DateTime launchDate;
    
    Spacecraft(this.name, this.launchDate){
      name = name+'님';
    }
    int get launchYear => launchDate.year;

    void describe(){
      print('Spacecraft : $name');
      if(launchDate != null){
          // DateTime.now() 빼기 launchDate
          //즉 현재 날짜에서 얼마만큼 지났는지 구한 다음 365로 나눈 것
          int years = DateTime.now().difference(launchDate).inDays ~/365;
          print('Launched : $launchYear ($years years ago)');
      } else{
        print('Unlaunched');
      }
    }
}
//상속
class Orbiter extends Spacecraft{
  num altitude;
  Orbiter(String name, DateTime launchDate, this.altitude):super(name, launchDate);
  @override
  void describe(){
    super.describe();
    print('추가 정보');
    print('altitude : $altitude');
  }
}

//생성자가 정의된 클래스는 with으로 사용할 수 없으므로
//PilotedCraft에서 mixin을 하기 위해서는 Piloted에 생성자가 있으면 안된다
//mixin이란? https://paulaner80.tistory.com/entry/Dart-mixin-%EC%9D%B4%EB%9E%80-1
class Piloted{
  int astronaunts = 1;
  void describeCrew(){
    print('Number of astronauts : $astronaunts');
  }
}

class PilotedCraft extends Spacecraft with Piloted{
  PilotedCraft(String name, DateTime launchDate) : super(name, launchDate);

}

//dart에는 인터페이스라는 개념은 없다.
//dart에서의 implements는 이를 통해 클래스를 재정의할 수 있다는 것을 의미한다.
class MockSpaceship implements Spacecraft{  

  @override
  DateTime launchDate;
  @override
  String name;
  MockSpaceship(this.launchDate, this.name);
  
  @override
  void describe() {
    // TODO: implement describe
  }

  @override
  // TODO: implement launchYear
  int get launchYear => throw UnimplementedError();

}

//추상클래스
abstract class Describable{
  void describe();
  void describeWithEmphasis(){
    print('============');
    describe();
    print('============');
  }
}
class Unit extends Describable{
  @override
  void describe() {
    print('This is unit');
  }

}