import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/app_background.png'),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: new Container(
          padding: EdgeInsets.all(16.0),
          child: Form(
            child: new ListView(
              shrinkWrap: true,
              children: <Widget>[
                _showFullNameField(),
                  _showUsernameField(),
                  _showEmailField(),
                  _showPasswordField(),
                  _showPrimaryButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _showFullNameField() {
    return new Padding(
      padding: EdgeInsets.only(left: 15.0, top: 15.0, right: 15),
      child: TextField(
        autofocus: false,
        style: TextStyle(fontSize: 18.0, color: new Color(0xff26d3ba)),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          labelText: 'Full Name',
          contentPadding:
              const EdgeInsets.only(left: 14.0, bottom: 12.0, top: 12.0),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(25.7),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(25.7),
          ),
        ),
      ),
    );
  }

  Widget _showUsernameField() {
      return new Padding(
          padding: EdgeInsets.only(left: 15.0, top: 15.0, right: 15),
          child: TextField(
              autofocus: false,
              style: TextStyle(fontSize: 18.0, color: new Color(0xff26d3ba)),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Username',
                  contentPadding:
                  const EdgeInsets.only(left: 14.0, bottom: 12.0, top: 12.0),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(25.7),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(25.7),
                  ),
              ),
          ),
      );
  }

  Widget _showEmailField() {
      return new Padding(
          padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
          child: TextField(
              autofocus: false,
              style: TextStyle(fontSize: 18.0, color: new Color(0xff26d3ba)),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Email',
                  contentPadding:
                  const EdgeInsets.only(left: 14.0, bottom: 12.0, top: 12.0),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(25.7),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(25.7),
                  ),
              ),
          ),
      );
  }

  Widget _showPasswordField() {
      return new Padding(
          padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
          child: TextField(
              autofocus: false,
              style: TextStyle(fontSize: 18.0, color: new Color(0xff26d3ba)),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Password',
                  contentPadding:
                  const EdgeInsets.only(left: 14.0, bottom: 12.0, top: 12.0),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(25.7),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(25.7),
                  ),
              ),
          ),
      );
  }

  Widget _showPrimaryButton(){
      return new Padding(
          padding: EdgeInsets.fromLTRB(40.0, 45.0, 40.0, 0.0),
          child: SizedBox(
              height: 45.0,
              child: new RaisedButton(
                  elevation: 5.0,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                  ),
                  color: new Color(0xff474a65),
                  child: new Text(
                      'Create my Account',
                      style: new TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                      ),
                  ),
                  onPressed: null,
              ),
          ),
      );
  }
}
