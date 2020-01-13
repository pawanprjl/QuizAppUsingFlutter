import 'package:flutter/material.dart';
import 'package:quiz/pages/Dashboard.dart';
import 'package:quiz/pages/authentication/signup_page.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  // variable declaration
  double height, width;

  AnimationController controller;
  Animation<double> animation;

  final _formKey = new GlobalKey<FormState>();

  String _email, _password, _errorMessage;
  bool _isLoading;
  bool _isFormInvalid;

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void validateAndSubmit() async {
    setState(() {
      _errorMessage = "";
      _isLoading = true;
      _isFormInvalid = false;
    });
    if (validateAndSave()) {
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _isLoading = false;
          if (_email != "pawan" && _password != "123") {
            _isFormInvalid = true;
          } else {
            _isFormInvalid = false;
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Dashboard()));
          }
        });
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _isLoading = false;
    _errorMessage = "";
    _isFormInvalid = false;

    controller = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
    );

    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });

    controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height / 640.0;
    width = MediaQuery.of(context).size.width / 360.0;

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            new Color(0xffa1cae1),
            new Color(0xff26d3ba),
            new Color(0xff2e61a5)
          ])),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: <Widget>[
              _showForm(),
              _showCircularProgress(),
            ],
          )),
    );
  }

  Widget _showForm() {
    return new Container(
        padding: EdgeInsets.all(height * 16.0),
        child: new Form(
            key: _formKey,
            child: new ListView(
              shrinkWrap: true,
              children: <Widget>[
                _showLogo(),
                _showInvalidInputMessage(),
                _showEmailInput(),
                _showPasswordInput(),
                _showPrimaryButton(),
                _showSecondaryButton(),
                _showErrorMessage(),
              ],
            )));
  }

  Widget _showErrorMessage() {
    if (_errorMessage.length > 0 && _errorMessage != null) {
      return new Text(
        _errorMessage,
        style: TextStyle(
          fontSize: 13,
          color: Colors.red,
          height: 1.0,
          fontWeight: FontWeight.w300,
        ),
      );
    } else {
      return new Container(
        height: 0.0,
      );
    }
  }

  Widget _showLogo() {
    return new Hero(
      tag: 'quiz_logo',
      child: Padding(
          padding: EdgeInsets.fromLTRB(0.0, height * 60.0, 0.0, 0.0),
          child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: height * 75.0,
              child: Image.asset('assets/app_icon.png'))),
    );
  }

  Widget _showInvalidInputMessage() {
    if (!_isFormInvalid) {
      return Container(
        height: height * 30.0,
        width: 0.0,
      );
    } else {
      return Padding(
        padding: EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
        child: new Text(
          'Invalid username and/or password!',
          style: TextStyle(fontSize: 17.0, color: Colors.red),
        ),
      );
    }
  }

  Widget _showEmailInput() {
    return Padding(
        padding: EdgeInsets.fromLTRB(0.0, height * 30.0, 10.0, 0.0),
        child: new TextFormField(
          maxLines: 1,
          keyboardType: TextInputType.emailAddress,
          autofocus: false,
          decoration: new InputDecoration(
              labelText: 'Email',
              icon: new Icon(
                Icons.mail,
                color: Colors.black,
              )),
          validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
          onSaved: (value) => _email = value.trim(),
        ));
  }

  Widget _showPasswordInput() {
    return Padding(
        padding: EdgeInsets.fromLTRB(0.0, height * 10.0, 10.0, 0.0),
        child: new TextFormField(
          maxLines: 1,
          obscureText: true,
          autofocus: false,
          decoration: new InputDecoration(
              labelText: 'Password',
              icon: new Icon(
                Icons.lock_outline,
                color: Colors.black,
              )),
          validator: (value) =>
              value.isEmpty ? 'Password can\'t be empty' : null,
          onSaved: (value) => _password = value.trim(),
        ));
  }

  Widget _showPrimaryButton() {
    return new Padding(
      padding: EdgeInsets.fromLTRB(0.0, height * 45.0, 0.0, 0.0),
      child: SizedBox(
        height: height * 45.0,
        child: new RaisedButton(
          elevation: 5.0,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          ),
          color: new Color(0xff474a65),
          child: new Text(
            'Login',
            style: new TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
          onPressed: validateAndSubmit,
        ),
      ),
    );
  }

  Widget _showSecondaryButton() {
    return new Padding(
      padding: EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 0.0),
      child: FlatButton(
        padding: EdgeInsets.all(10.0),
        child: new Text(
          'Create an account',
          style: new TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.underline,
              decorationColor: Colors.white),
        ),
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => SignUp())),
      ),
    );
  }

  Widget _showCircularProgress() {
    if (_isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }
}
