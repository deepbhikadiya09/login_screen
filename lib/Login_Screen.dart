

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({Key? key}) : super(key: key);

  @override
  _Login_ScreenState createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FocusNode passwordLogInFocusNode = FocusNode();
  TextEditingController email_con = TextEditingController();
  TextEditingController password_con = TextEditingController();
  bool _passwordVisible = false;
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
  String? d1;
  String? d2;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Form(
              key: formKey,
              child: Column(
                children: [

                  SizedBox(
                    height: 200,
                    child: Image.network(
                        "https://img.freepik.com/free-vector/access-control-system-illustration_335657-4640.jpg?t=st=1648288245~exp=1648288845~hmac=590c8ad2ae4fb8bc981bd6d211352d48c4bcc1b8d0b56af080ae66a6d089ef07&w=740"),
                  ),
                  TextFormField(
                    onFieldSubmitted: (v) {
                      passwordLogInFocusNode.requestFocus();
                    },
                    validator: (value) => validateEmail(value),
                    controller: email_con,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
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
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onFieldSubmitted: (v) {
                      passwordLogInFocusNode.requestFocus();
                    },
                    validator: (value) => validatepswd(value),
                    obscureText: !_passwordVisible,
                    controller: password_con,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      suffix: InkWell(
                        onTap: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                        child: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.brown,
                        ),
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
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                  width: 150,
                      height: 40,
                      child: ElevatedButton(onPressed: () {
                        if (formKey.currentState!.validate()) {
                          if(d1==email_con && d2==password_con){
                            showToast(msg: 'successful');
                          }
                        }
                      }, child: Text("Log in",style: TextStyle(fontSize: 20),),),),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Forgot your password?",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.brown,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 5,),
                      InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/Forgot');

                          },
                          child: Text(
                            "Click here",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ))
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "No account yet?",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.brown,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 5,),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/Signup');
                        },
                        child: Text(
                          "sign up",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 15,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                  Text("$d1 \n $d2"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }



  void setData(String email,String password)async{
    SharedPreferences preferences=await SharedPreferences.getInstance();

    preferences.setString('e1', email);
    preferences.setString('p1', password);
  }
  void getData()async{
    SharedPreferences preferences =await SharedPreferences.getInstance();
    String data1 = preferences.get('e1').toString();
    String data2 = preferences.get('p1').toString();
    setState(() {
      d1=data1;
      d2=data2;
    });
  }

  void showToast({String? msg }) {
    Fluttertoast.showToast(
        msg: msg!,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        fontSize: 20,
        backgroundColor: Colors.green
    );
  }



}
