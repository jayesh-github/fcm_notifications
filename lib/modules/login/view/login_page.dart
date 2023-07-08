import 'package:concept_project/modules/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.loose,
        children: [
          Image.asset(
            height: Get.height * 0.55,
            'assets/background_image.png',
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.fromLTRB(30, 3, 20, 0),
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          height: 50,
                          decoration: BoxDecoration(
                              color: AppColors.lightGrey,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: Colors.black,
                            controller: _emailController,
                            textInputAction: TextInputAction.search,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.email_outlined),
                                color: Colors.grey,
                              ),
                              hintText: 'Enter Email',
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                            style: TextStyle(color: Colors.black),
                          )),
                      SizedBox(height: 16.0),
                      Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.fromLTRB(30, 3, 20, 0),
                          margin: EdgeInsets.only(left: 10, right: 10),
                          height: 50,
                          decoration: BoxDecoration(
                              color: Color(0xFFD3D3D3),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: Colors.black,
                            controller: _passwordController,
                            textInputAction: TextInputAction.search,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.email_outlined),
                                color: Colors.grey,
                              ),
                              hintText: 'Enter Password',
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                            style: TextStyle(color: Colors.black),
                          )),
                      SizedBox(height: 16.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                              value: isChecked,
                              onChanged: (value) {
                                setState(() {
                                  isChecked = value;
                                });
                              }),
                          Text("Remember Me")
                        ],
                      ),
                      SizedBox(
                        width: Get.width - 50,
                        height: 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: const BorderSide(color: Colors.blueAccent),
                            ),
                          ),
                          onPressed: () {
                            String email = _emailController.text;
                            String password = _passwordController.text;
                            // Perform login authentication here

                            // For this example, just print the email and password
                            print('Email: $email');
                            print('Password: $password');
                          },
                          child: Text('Login'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
