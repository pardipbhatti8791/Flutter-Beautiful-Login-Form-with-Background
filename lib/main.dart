import 'package:flutter/material.dart';

void main() {
  runApp(new GpApp());
}

class GpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
        title: "Login Page",
        home: new LoginPage(),
        theme: new ThemeData(primarySwatch: Colors.blue));
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;
  
  bool _buttonEnabled = true;

  @override
  void initState() {
    super.initState();

    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 500));
    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.easeIn);
    _iconAnimation.addListener(() => setState(() {}));
    _iconAnimationController.forward();

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.greenAccent,
        body: new Stack(fit: StackFit.expand, children: <Widget>[
          new Image(
            image: new AssetImage("assets/background.jpg"),
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new FlutterLogo(size: _iconAnimation.value * 100),
              // new Image(
              //   image: new NetworkImage("https://gpcoders.com/wp-content/uploads/2018/02/gpcoders_logo.png"),
              //   width: 200.0,
              // ),
             
              new Form(
                  child: new Theme(
                    data: new ThemeData(
                      brightness: Brightness.dark,
                      primarySwatch: Colors.green,
                      inputDecorationTheme: new InputDecorationTheme(
                        labelStyle: new TextStyle(
                          color: Colors.greenAccent,
                          fontSize: 16.0
                        )
                      )
                    ),
                    child: new Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Padding(
                            padding: const EdgeInsets.only(left: 50.0, right: 50.0, bottom: 8.0),
                            child: new TextField(
                              decoration: new InputDecoration(labelText: "Enter Email", suffixIcon: new Icon(Icons.person) ),
                              keyboardType: TextInputType.emailAddress,
                              autocorrect: false,
                            ),
                          ),
                          new Padding(
                            padding: const EdgeInsets.only(left: 50.0, right: 50.0, bottom: 20.0),
                            child: new TextField(
                              decoration:
                                  new InputDecoration(labelText: "Enter Password", suffixIcon: new Icon(Icons.lock)),
                              keyboardType: TextInputType.text,
                              obscureText: true,
                            ),
                          ),
                          new Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: new MaterialButton(
                              height: 40.0,
                              minWidth: 100.0,
                              color: Colors.greenAccent,
                              textColor: Colors.white,
                              child: new Text("Login"),
                              onPressed: () => setState(() {
                                _buttonEnabled = false;
                              }),
                            ),
                          )
                        ],
                      ),
                    ),
              ))
            ],
          )
        ]));
  }
}
