import 'package:flutter/material.dart';
import 'package:themoviedb/Theme/button_style.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login to your account'),
      ),
      body: ListView(
        children: [
          _HeaderWidget(),
        ],
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = const TextStyle(fontSize: 16, color: Colors.black);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 25),
          _FormWidget(),
          SizedBox(height: 25),
          Text(
            'In order to use the editing and rating capabilities of TMDB, as well as get personal recommendation you will need to login to your account. If you do not have an account, registering for an account is free and simple.', 
            style: textStyle),
          SizedBox(height: 5),
          TextButton(onPressed: (){}, child: Text('Register'),
          style: AppButtonStyle.linkButton,),
          SizedBox(height: 25),
          Text(
            'If you signed up but didn\'t get your verification email.', 
            style: textStyle),
          SizedBox(height: 5),
          TextButton(onPressed: (){}, child: Text('Verify email'),
          style: AppButtonStyle.linkButton),
        ],
      ),
    );
  }
}

class _FormWidget extends StatefulWidget {
  const _FormWidget({super.key});

  @override
  State<_FormWidget> createState() => __FormWidgetState();
}

class __FormWidgetState extends State<_FormWidget> {
  final _loginTextController = TextEditingController(text: 'admin');
  final _passwordTextController = TextEditingController(text: 'admin');
  String? errorText = null;
  void _auth(){
    final login = _loginTextController.text;
    final password = _passwordTextController.text;
    if (login == 'admin' && password == 'admin') {
      errorText = null;

      Navigator.of(context).pushReplacementNamed('/mainScreen');
    }else{
      errorText = 'Не верный логин или пароль';
    }
    setState(() {
    });
  }
  void _resetPassword(){
    print('reset Password');
  }
  @override
  Widget build(BuildContext context) {
    final textStyle = const TextStyle(fontSize: 16, color: Color(0xFF212529));
    final textFieldDecorator = InputDecoration(
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      isCollapsed: true, );
      final color = const Color(0xFF01B4E4);
      final errorText = this.errorText;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (errorText != null) ...[
        Text(
          errorText,
          style: TextStyle(
            fontSize: 17,
            color: Colors.red)),
        SizedBox(height: 20),
        ],
        Text('Username',
        style: textStyle),
        SizedBox(height: 5),
        TextField(controller: _loginTextController, 
        textInputAction: TextInputAction.next,
        decoration: textFieldDecorator,),
        SizedBox(height: 20),
        Text('Password',
        style: textStyle,),
        SizedBox(height: 5),
        TextField(
         controller: _passwordTextController,
         onEditingComplete: _auth,
         textInputAction: TextInputAction.next,
         decoration: textFieldDecorator,
        obscureText: true,),
        SizedBox(height: 25),
        Row(
          children: [
            ElevatedButton(onPressed: _auth, 
            style:  ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)
                )
              ),
              backgroundColor:  MaterialStateProperty.all(color),
              foregroundColor: MaterialStateProperty.all(Colors.white),
              textStyle: MaterialStateProperty.all(
                TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
              padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(horizontal: 15, vertical: 8)
              ),
              
            ),
            child: Text('Login')),
            SizedBox(width: 30),
            TextButton(onPressed: _resetPassword,
            style:  AppButtonStyle.linkButton, 
            child: Text('Reset password'))
          ],
        )
      ],
    );
  }
}