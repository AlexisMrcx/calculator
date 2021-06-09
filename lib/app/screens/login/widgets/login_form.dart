import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateForm = AutovalidateMode.disabled;

  Map<String, dynamic> data = {};

  onLoggingPressed(){
    if(_formKey.currentState.validate()){
      print('login succedded');
      data['email'] = _emailController.text;
      data['password'] = _passwordController.text;
    }else {
      FocusScope.of(context).requestFocus(FocusNode());
      _formKey.currentState.validate();
      setState(() {
        _autovalidateForm = AutovalidateMode.always;
      });
    }
  }

  String validateEmail(String value){
    String pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp regExp = RegExp(pattern);

    if(!regExp.hasMatch(value)){
      return 'email non valide !';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Container(
         child : Padding(
           padding: const EdgeInsets.all(40),
           child: Container( 
             child: SingleChildScrollView(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      autovalidateMode: _autovalidateForm,
                      key: _formKey,
                      child: Column(
                       children : [
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: TextFormField(
                             keyboardType: TextInputType.emailAddress,
                             controller: _emailController,
                             validator: (value) {
                               return validateEmail(value);
                             },
                             decoration: InputDecoration(
                               labelText: 'E-mail',
                               helperText: 'votre email',
                               hintText: 'email@example.com'
                             ),
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: TextFormField(
                             controller: _passwordController,
                             decoration: InputDecoration(
                               labelText: 'Mot de passe',
                               helperText: 'votre mot de passe',                            
                             ),
                             validator: (value){
                               if(value.length<2){
                                 return 'Mot de passe trop court';
                               } else {
                                 return null;
                               }
                             },
                             obscureText: true,
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: OutlinedButton(
                             onPressed: onLoggingPressed, 
                             child: Text('Se connecter')
                             ),
                         )
                       ]
                     ),
                 ),
                  ),
               ),
             ),
           ),
         )
       ),
    );
  }
}