import 'package:flutter/services.dart';
import 'main.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomPaint(
        painter: BackgroundSignUp(),
        child: Stack(
          children: <Widget>[
            GestureDetector(
              onTap: () { //сделать переход (от)
                Navigator.pop(context);
              },                                //(до)
              child: Container(
                padding: const EdgeInsets.only(left: 25.0, top: 35.0), //отступы слева и пикселей
                child: Icon(
                    Icons.arrow_back_ios,color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                children: <Widget>[
                  _getHeader(),
                  _getInputs(),
                  _getSignUp(context),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

_getHeader() {
  return Expanded(
    flex: 4,
    child: Container(
      alignment: Alignment.bottomLeft,
      child: Text('Регистрация',
        style: TextStyle(color: Colors.white,
            fontStyle: FontStyle.italic,
            fontSize: 37),
      ),
    ),
  );
} //

_getInputs(){
  return Expanded(
    flex: 4,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            labelText: 'Имя',
            labelStyle: TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        TextField(
          decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              labelText: 'Логин',
              labelStyle: TextStyle(color: Colors.white)
          ),
        ),
        SizedBox(
          height: 15,
        ),
        TextField(
          decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              labelText: 'Пароль',
              labelStyle: TextStyle(color: Colors.white)
          ),
        ),
      ],
    ),
  );
}

_getSignUp(context){
  return Expanded(
    flex: 2,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: CircleAvatar( //Создание кнопки
              backgroundColor: Colors.green.shade800,
              radius: 40,
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              )
          ),
        )
      ],
    ),
  );
}

class BackgroundSignUp extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var sw = size.width;
    var sh = size.height;
    var paint = Paint();

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0,0,sw,sh));
    paint.color = Colors.yellow.shade800;
    canvas.drawPath(mainBackground, paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate){
    return oldDelegate != this;
  }
}