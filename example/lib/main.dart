import 'package:flutter/material.dart';
import 'package:flutter_highlight_korean_text/flutter_highlight_korean_text.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Highlight Korean Text Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HighlightTextExample(),
    );
  }
}

class HighlightTextExample extends StatefulWidget {
  @override
  _HighlightTextExampleState createState() => _HighlightTextExampleState();
}

class _HighlightTextExampleState extends State<HighlightTextExample> {
  TextEditingController _controller = TextEditingController();
  String _query = '';  // 하이라이팅할 쿼리

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Highlight Korean Initials Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter text to highlight',
                border: OutlineInputBorder(),
              ),
              onChanged: (text) {
                setState(() {
                  // 사용자가 입력한 쿼리를 처리합니다.
                  _query = text;
                });
              },
            ),
            SizedBox(height: 20),
            // 사용자 입력을 하이라이팅한 텍스트 표시
            Text.rich(
              _controller.text.toHighlightedText(
                query: _query,
                normalStyle: TextStyle(color: Colors.black, fontSize: 18),
                highlightedStyle: TextStyle(color: Colors.red, fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Test text highlighting with Korean initials:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // 테스트 텍스트에서 하이라이팅
            Text.rich(
              '대한민국은 아름다운 나라입니다.'.toHighlightedText(
                query: 'ㄷ',
                normalStyle: TextStyle(color: Colors.black, fontSize: 18),
                highlightedStyle: TextStyle(color: Colors.red, fontSize: 18),
              ),
            ),
            SizedBox(height: 10),
            Text.rich(
              '서울은 멋진 도시입니다.'.toHighlightedText(
                query: 'ㅅ',
                normalStyle: TextStyle(color: Colors.black, fontSize: 18),
                highlightedStyle: TextStyle(color: Colors.red, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
