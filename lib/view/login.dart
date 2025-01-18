import 'package:flutter/material.dart';
import 'package:healthy_recipies/view/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool issuccess = true;
  bool obscurePass = true;
  void setData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email.text);
    await prefs.setString('password', password.text);
  }
  void getData()async{
     SharedPreferences prefs = await SharedPreferences.getInstance();
final String? email = prefs.getString('email');
final String? password = prefs.getString('password');
if (email=="saad@gmail.com"&& password=="1234") {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Dashboard()));
}else{
  print("error");
}
    

  }
  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/login2.png"), fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: email,
                decoration: InputDecoration(

                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: "Email",
                  hintText: "enter a valid email id ",
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: password,
                obscureText: obscurePass,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: "Password",
                  hintText: "enter your correct password",
                  prefixIcon: GestureDetector(
                      onTap: () {
                        print("oaajaiajiajaijaiaj");
                        obscurePass = !obscurePass;

                        setState(() {});
                      },
                      child: obscurePass
                          ? Icon(Icons.visibility)
                          : Icon(Icons.abc)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (email.text == "saad@gmail.com" &&
                        password.text == "1234") {
                      setData();
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Dashboard()));
                      issuccess = true;
                    } else {
                      issuccess = false;
                    }

                    setState(() {});
                  },
                  child: Text("Login")),
              issuccess ? Offstage() : Text("Error")
            ],
          ),
        ),
      ),
    );
  }
}
