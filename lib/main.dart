import 'package:flutter/material.dart';
import 'package:comics/pages/Catalog.dart';
import 'package:comics/pages/Comic.dart';
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

class ComicsCatalog extends StatelessWidget {
  final List<Comic> _comics = [
    Comic(
      title: 'Черепашки-Ниндзя: Приключения. Том 2. Возвращение Шреддера',
      description: 'Леонардо, Рафаэль, Микеланджело и Донателло... Эти имена знакомы каждому! Вторая книга включает выпуски TMNT Adventures #1-4 и расскажет о возвращении Шреддера, который вновь доставит неприятности нашей Зелёной Команде — сначала попытавшись очернить их в глазах общественности, а затем уменьшив при помощи инопланетного кристалла!',
      price: '300',
      images: ['https://static.insales-cdn.com/images/products/1/5735/382367335/tmnt_adv_2_alt_2_BKYf59C.jpg'],
    ),
    Comic(
      title: 'Комикс Хеллбой. Книга 1. Семя разрушения',
      description: 'Когда Вторая мировая приняла неудачный для нацистов оборот, те попытались переломить ход войны при помощи магии, но проведенный ими ритуал имел неожиданный результат: во-первых, призванный в наш мир демон попал не к нацистам, а к американцам, а во-вторых, он оказался всего лишь маленьким ребенком. Его прозвали "Хеллбой" - "мальчик из Ада".',
      price: '300',
      images: ['https://i.imgur.com/dvwWv6e.jpg'],
    ),
    Comic(
      title: 'Супермен. Полная энциклопедия Человека из Стали',
      description: 'Вот уже 80 лет Кларк Кент стоит на страже справедливости и защиты людей. За это время его личность обросла множеством историй. Пришелец из далекого мира, он рос как обычный человек, пока его способности не проявились. Он сражался с множеством злодеев на Земле на других планетах и даже в параллельных мирах, тысячу раз рискуя своей жизнью ради других. По праву считаясь одним их сильнейших и добрейших супергероев в истории комиксов.',
      price: '300',
      images: ['https://www.hybrisonline.com/pub_images/original/WB-42-SUP001.jpg'],
    ),
  ];

  int _selectedComicIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Каталог комиксов', style: TextStyle(color: Colors.black)),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _comics.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ComicPage(_comics[index])));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            _comics[index].images[0],
                            width: 100,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(_comics[index].title),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _comics.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_comics[index].title),
                  leading: CircleAvatar(
                    backgroundColor: Colors.deepPurple,
                    child: ClipOval(
                      child: Image.network(
                        _comics[index].images[0],
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ComicPage(_comics[index])));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
