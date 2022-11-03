import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waitech/riverpod/riverpod_management.dart';

class LoginPage extends ConsumerStatefulWidget {
  static const String routeName = '/login';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => LoginPage(),
        settings: const RouteSettings(name: routeName));
  }

  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f9),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  child: Image.asset("assets/images/Waitech_logo.png"),
                ),
              ),
              SizedBox(height: 30),

              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Center(
                  child: Text(
                    'Welcome back you have been missed!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.asap(
                      color: Color(0xff697a8d),
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: ref.read(loginRiverpod).email,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),

              //Password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: ref.read(loginRiverpod).password,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),

              //Login button and (register now)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  padding: EdgeInsets.all(25),
                  child: ElevatedButton(
                    onPressed: () => ref.read(loginRiverpod).fetch(),
                    child: Text("Giriş Yap"),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 29.0),
                    child: Text(
                      'Üye değil misiniz?',
                      style: TextStyle(color: Color(0xff697a8d)),
                    ),
                  ),
                  Text(
                    ' Hesap oluşturun',
                    style: TextStyle(
                      color: Color(0xff696cff),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
