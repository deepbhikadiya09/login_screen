
import 'package:flutter/material.dart';


class ForgotPaaaword_Screen extends StatefulWidget {
  const ForgotPaaaword_Screen({Key? key}) : super(key: key);

  @override
  _ForgotPaaaword_ScreenState createState() => _ForgotPaaaword_ScreenState();
}

class _ForgotPaaaword_ScreenState extends State<ForgotPaaaword_Screen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();



  String? validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value))
      return 'Enter a valid email address';
    else
      return null;
  }
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Forgot Password",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 120,),
                    Text(
                      "Forgot Your Password",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.brown,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 30,),
                    TextFormField(
                      controller: email,
                      textInputAction: TextInputAction.done,
                      validator: (value) => validateEmail(value),
                      keyboardType: TextInputType.emailAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        labelText: "Email",
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
                    SizedBox(height: 30,),
                    SizedBox(
                      width: 150,
                      height: 40,
                      child: ElevatedButton(onPressed: () {
                        if (formKey.currentState!.validate()) {

                        }
                      }, child: Text("Send",style: TextStyle(fontSize: 20),),),),

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
