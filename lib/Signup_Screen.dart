import 'package:flutter/material.dart';

class Signup_Screen extends StatefulWidget {
  const Signup_Screen({Key? key}) : super(key: key);

  @override
  _Signup_ScreenState createState() => _Signup_ScreenState();
}

class _Signup_ScreenState extends State<Signup_Screen> {


  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _PasswordVisible = false;
  bool _ConfirmPasswordVisible = false;
  FocusNode passwordLogInFocusNode = FocusNode();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirm_password = TextEditingController();
  String? validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value))
      return 'Enter a valid email address';
    else
      return null;
  }
  String? validatepswd(String? value) {
    String pattern = r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+";

    RegExp regex = RegExp(pattern);

    if (value == null || value.isEmpty || !regex.hasMatch(value))
      return 'Enter a valid password';
    else
      return null;
  }
  String? validatename(String? value) {
    String pattern = r"^[a-zA-Z]+";

    RegExp regex = RegExp(pattern);

    if (value == null || value.isEmpty || !regex.hasMatch(value))
      return 'Enter a valid name';
    else
      return null;
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: (){
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text("Sign up"),
            centerTitle: true,
          ),
          body: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                  SizedBox(height: 15,),
                Text(
                      "Create account",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.brown.shade300,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 15,),
                    TextFormField(

                      controller: name,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => validatename(value),
                      decoration: InputDecoration(
                        hintText: "Name",
                        fillColor: Colors.lightGreen,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          borderSide:
                          BorderSide(color: Colors.lightGreen, width: 2.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      controller: email,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => validateEmail(value),
                      decoration: InputDecoration(
                        hintText: "Email",
                        fillColor: Colors.lightGreen,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          borderSide:
                          BorderSide(color: Colors.lightGreen, width: 2.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      onFieldSubmitted: (v) {
                        passwordLogInFocusNode
                            .requestFocus();
                      },
                      textInputAction: TextInputAction.next,
                      validator: (value)=>validatepswd(value),
                      controller: password,
                      obscureText: !_PasswordVisible,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        suffix: InkWell(
                          onTap: (){
                            setState(() {
                              _PasswordVisible = !_PasswordVisible;
                            });
                          },
                          child: Icon(_PasswordVisible ? Icons.visibility : Icons.visibility_off,color: Colors.brown,),
                        ),

                        hintText: "Password",
                        fillColor: Colors.lightGreen,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          borderSide:
                          BorderSide(color: Colors.lightGreen, width: 2.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      focusNode: passwordLogInFocusNode,
                      textInputAction: TextInputAction.done,
                      validator: (val) {
                        if (val!.isEmpty) return 'Enter a valid Password';
                        if (password.text !=
                            confirm_password.text){
                          return 'Password are not matched';
                        }
                        return null;
                      },
                      controller: confirm_password,
                      obscureText: !_ConfirmPasswordVisible,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        suffix: InkWell(
                          onTap: (){
                            setState(() {
                              _ConfirmPasswordVisible = !_ConfirmPasswordVisible;
                            });
                          },
                          child: Icon(_ConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,color: Colors.brown,),
                        ),
                        hintText: "Confirm password",
                        fillColor: Colors.lightGreen,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          borderSide:
                          BorderSide(color: Colors.lightGreen, width: 2.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),
                    SizedBox(
                        width: 150,
                        height: 40,
                        child: ElevatedButton(onPressed: () {
                          if (formKey.currentState!.validate()) {
                            Navigator.pushNamed(context, '/');

                          }
                        }, child: Text("Sign up",style: TextStyle(fontSize: 20),),),),



                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
