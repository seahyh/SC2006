import 'package:flutter/material.dart';
import 'package:next_stage/screens/lawyerPage.dart';
import 'package:next_stage/screens/registrationPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'homePage.dart';


Image logoWidget(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 240,
    height: 240,
   // color: Colors.white,
  );
}

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Login'),
          automaticallyImplyLeading: false,
        ),
      //  padding: const EdgeInsets.all(10),
      body: Center(
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'ONE-STOP AFTERLIFE PROCEDURE',
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                      fontSize: 23),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: logoWidget("assets/images/logo1.PNG"),

              ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            TextButton(
              onPressed: () {

                //forgot password screen
              },
              child: const Text('Forgot Password',),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () {
                    FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                        email: nameController.text,
                        password: passwordController.text)
                        .then((value) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const HomeScreen()));
                    }).onError((error, stackTrace) {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                              title: Text('Error!'),
                              content: Text("${error.toString()}"),
                              actions: [
                                TextButton(
                                  child: Text('CANCEL'),
                                  onPressed: () => Navigator.pop(context),
                                )
                              ]
                          )
                      );
                      print("Error ${error.toString()}");
                    });
                    //print(nameController.text);
                    //print(passwordController.text);
                    //Navigator.push(context,
                    // MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Does not have account?'),
                TextButton(
                  child: const Text(
                    'Sign up',
                    style: TextStyle(fontSize: 15),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const registerPage()));

                    //signup screen
                  },
                )
              ],
            ),
          ],
        )));
  }
}
