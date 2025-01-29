import 'package:flutter/material.dart';
import 'package:jyothi_labs_ecommerce/Controller/auth_controller.dart';
import 'package:jyothi_labs_ecommerce/View/dashboard_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  AuthController authController = AuthController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isSuccess = true;
  bool obscurePass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/login-bg.jpg",
              ),
              opacity: 0.6,
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  labelText: "Enter Username",
                  hintText: "e.g. JohnDoe",
                  prefixIcon: const Icon(Icons.person),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: passwordController,
                obscureText: obscurePass,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  labelText: "Enter Password",
                  hintText: "Password",
                  suffixIcon: GestureDetector(
                    onTap: () {
                      obscurePass = !obscurePass;
                      setState(() {});
                    },
                    child: obscurePass
                        ? const Icon(
                            Icons.visibility,
                          )
                        : const Icon(
                            Icons.visibility_off,
                          ),
                  ),
                  prefixIcon: const Icon(
                    Icons.lock,
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      authController.login(
                        emailController.text,
                        passwordController.text,
                      );
                      authController.authtoken == null
                          ? isSuccess = false
                          : {
                              isSuccess = true,
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DashboardView()))
                            };
                    },
                    child: const Text("Login")),
              ),
              isSuccess ? Text("") : const Text("Oops, Try again!")
            ],
          ),
        ),
      ),
    );
  }
}
