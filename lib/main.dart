import 'package:flutter/material.dart';
import 'package:laptev_malkov/components/item_list.dart';
import 'signup.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      //home: SignUpApp(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class SignUpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: LoginPage(),
      home: SignUpPage(),
    );
  }
}

class _LoginPageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: BackgroundSignIn(),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 33),
              child:  Column(
                children: <Widget>[
                  _getHeader(),
                  _getInputs(),
                  _getSignIn(context),
                  _getBottomRow(context),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

_getHeader(){
  return Expanded(
    flex: 2,
    child: Container(
      color: Colors.yellow.shade800,
      alignment: Alignment.bottomLeft,
      width:1500,
      child: Text(
        'Добро пожаловать!',
        style: TextStyle(color: Colors.white,
            fontStyle: FontStyle.italic,
            fontSize: 37
        ),
      ),
    ),
  );
}

_getInputs(){
  return Expanded(
    flex: 4,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextField(
          decoration: InputDecoration(labelText: 'Логин'),
        ),
        SizedBox(
          height: 15,
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Пароль'),
        ),
        SizedBox(
          height: 15,
        ),
      ],
    ),
  );
}

_getSignIn(context){
  return Expanded(
    flex: 1,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget> [
        GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ComicsCatalog()));
            }, //фигура как переход
            child: CircleAvatar(
              backgroundColor: Colors.green.shade800,
              radius: 30,
              child: Icon(Icons.arrow_forward_ios, color: Colors.white,),
            )
        )
      ],
    ),
  );
}

_getBottomRow(context) {
  return Expanded(
    flex: 2,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignUpPage()));
          },
          child: Text('Регистрация', style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline),
          ),
        ),
        Text('Забыл пароль', style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.underline),
        ),
      ],
    ),
  );
}

class BackgroundSignIn extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size){
    var sw = size.width;
    var sh = size.height;
    var paint = Paint();

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0,0, sw, sh));
    paint.color = Colors.yellow.shade800;
    canvas.drawPath(mainBackground, paint);



  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate){
    return oldDelegate != this;

  }

}