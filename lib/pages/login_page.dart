import 'package:app_chat/widgets/boton_azul.dart';
import 'package:app_chat/widgets/custom_input.dart';
import 'package:app_chat/widgets/labels_login.dart';
import 'package:app_chat/widgets/logo.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF2F2F2),
        body: SafeArea(
          //SingleChildScrollView nos permite girar el celular y hacer responsivo pero se nos pega todo
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(), //efecto rebote
            child: Container(
              height: MediaQuery.of(context).size.height *
                  0.9, // permite extender todo
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Logo( titulo: 'Messenger',),
                  _Form(),
                  LabelsLogin( ruta: 'register', text1: 'No tienes cuenta', text2: 'Crea Una Ahora',),
                  Text(
                    'Terminos Y Condiciones',
                    style: TextStyle(fontWeight: FontWeight.w200),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: <Widget>[
          CustomInput(
            icon: Icons.mail_outline,
            placeholder: 'Correo',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          CustomInput(
            icon: Icons.lock_outline,
            placeholder: 'Contraseña',
            keyboardType: TextInputType.visiblePassword,
            textController: passCtrl,
            isPassword: true,
          ),
          BotonAzul(
            text: 'Ingrese',
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'usuarios');
            },
          ),
        ],
      ),
    );
  }
}
