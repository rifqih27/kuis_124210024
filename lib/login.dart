import 'package:flutter/material.dart';
import 'package:untitled/halamanutama.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  String username= "";
  String password= "";

  bool islogin=false;
  bool ispasswordNotVisible = true;

  late TextEditingController usernameController;
  late TextEditingController passwordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    usernameController= TextEditingController();
    passwordController= TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.home),
        title: Text('pokemon'),
        actions: [
          Icon(Icons.search),
          Icon(Icons.lock),
        ],
      ),
      body: SingleChildScrollView(
        child:Padding(
          padding: const EdgeInsets.all(
              200.0),

          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network('https://raw.githubusercontent.com/abubabalim/praktikum_mobile/master/kuis/img/004.jpg'),
              SizedBox(
                height: 20,
              ),
              Text(
                'our pokemon',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 20,
              ),

              TextFormField(
                controller: usernameController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'input username',
                  labelText: 'username',
                ),
                onChanged: (value){username= value;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                obscureText: true,
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'input password',
                  labelText: 'password',
                ),
                onChanged: (value) {
                  password = value;
                },

              ),


              SizedBox(
                height: 100,
              ),

              ElevatedButton(
                  child: Text('login'),
                  onPressed:() {
                    String message= "";
                    username= usernameController.text;
                    password= passwordController.text.trim();
                    if(username=="pokemon"&& password=="12345678") {
                      Navigator.push(context, MaterialPageRoute(builder: ((context) => halamanutama())));
                      setState(() {
                        message = "login berhasil slebew";
                        islogin = true;


                      });
                    }
                    else {
                      message = "login gagal";
                      islogin = false;
                    }
                    var snackBar = SnackBar(content: Text(message),
                      backgroundColor: (islogin)? Colors.green: Colors.red,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
              ),



              TextButton(
                  onPressed:() {},
                  child: Text('lupa password?')
              ),
            ],
          ),
        ),
      ),
    );
  }
}

