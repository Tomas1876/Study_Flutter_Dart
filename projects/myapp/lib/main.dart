import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//StatefulWidget을 사용할 때는 이렇게 두 가지 클래스를 정의해야 한다
class RandomWordsSatae extends State<RandomWords> {
  final _suggestions = <WordPair>[]; //<WordPair> 타입만 담는 배열
  final _biggerFont = const TextStyle(fontSize: 18.0); // flutter에서는 픽셀 사용 x
  //_가 붙은건 이 파일 안에서만 접근 가능하다는 뜻
  //내부에서만 쓸 변수들은 이런 식으로 작명하는 것이 좋다

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase, //파스칼표기법으로 바꿔주기
        style: _biggerFont,
      ),
    );
  }

  //상태가 계속 바뀌는 것은 class가 아니라 state 안에서 작업하기
  @override
  Widget build(BuildContext context) {
    //final wordpair = WordPair.random();
    //return Text(wordpair.asPascalCase);
    return Scaffold(
      appBar: AppBar(title: Text('Startup Name Generator')),
      body: _buildSuggestions(),
    );
  }

  @override
  Widget _buildSuggestions() {
    //ListView
    return ListView.builder(
        //builder라는 이름의 ListView 생성자
        padding: const EdgeInsets.all(16.0),
        //itemBuilder는 리스트에 그려질 항목을 lazy하게,
        //해당 child가 화면에 보여져야 할 때 생성한다
        //많은 아이템을 보여주어야 할 때 사용한다
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();
          //Divider라는 위젯은 리스트와 리스트 사이의 구분선을 만들어준다

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            //addAll === list에 다수의 요소 추가하기
            _suggestions.addAll(
                generateWordPairs().take(10)); //10개씩 새 단어를 생성해서 몽땅 추가해준다
          }
          return _buildRow(_suggestions[index]);
        });
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsSatae createState() => RandomWordsSatae();
}

//StatelessWidget은 성능이 좋은 대신 기능이 별로 없다
//반면 StatefullWidget은 무거운만큼 기능들이 많다
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //final wordPair = WordPair.random();
    return MaterialApp(title: 'Welcome to Flutter', home: RandomWords());
  }
}
