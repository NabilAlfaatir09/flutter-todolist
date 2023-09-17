import 'package:flutter/material.dart';
import 'package:flutter_todolist/pages/home_page.dart';

import '../controllers/register_controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final registerControll = RegisterController();

  double getSmallDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 2 / 3;

  double getBigDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 7 / 8;

  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFEEEEEE),
      body: Form(
        key: registerControll.formKey,
        child: Stack(
          children: [
            Positioned(
              right: -getSmallDiameter(context) / 3,
              top: -getSmallDiameter(context) / 3,
              child: Container(
                width: getSmallDiameter(context),
                height: getSmallDiameter(context),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(64, 224, 208, 1),
                      Color.fromRGBO(217, 235, 255, 1),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
            Positioned(
              left: -getBigDiameter(context) / 4,
              top: -getBigDiameter(context) / 4,
              child: Container(
                width: getBigDiameter(context),
                height: getBigDiameter(context),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(217, 235, 255, 1),
                      Color.fromRGBO(64, 224, 208, 1),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: const Center(
                  child: Text(
                    "ToDoList",
                    style: TextStyle(
                        fontFamily: "Borel", fontSize: 35, color: Colors.white),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: -getSmallDiameter(context) / 2,
              right: -getSmallDiameter(context) / 2,
              child: Container(
                width: getBigDiameter(context),
                height: getBigDiameter(context),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 233, 241, 243),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ListView(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 300, 20, 10),
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 15),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(64, 224, 208, 1),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: registerControll.username,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Nama tidak boleh kosong";
                            }
                            return null;
                          },
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            icon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            labelText: "Username : ",
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                        TextFormField(
                          controller: registerControll.password,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password tidak boleh kosong";
                            }
                            return null;
                          },
                          style: const TextStyle(color: Colors.white),
                          obscureText: visible ? false : true,
                          decoration: InputDecoration(
                            icon: const Icon(
                              Icons.key,
                              color: Colors.white,
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            labelText: "Password : ",
                            labelStyle: const TextStyle(color: Colors.white),
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  visible = !visible;
                                });
                              },
                              child: Icon(visible
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 0, 20, 30),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(64, 224, 208, 1),
                        shape: const StadiumBorder(),
                        fixedSize:
                            Size(MediaQuery.of(context).size.width * 0.5, 40),
                      ),
                      onPressed: () {
                        if (registerControll.formKey.currentState!.validate()) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              //username.text adalah parameter yang dikiri
                              builder: (_) => HomePage(
                                username: registerControll.username.text,
                              ),
                            ),
                          );
                        }
                      },
                      child: const Text("Register"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
