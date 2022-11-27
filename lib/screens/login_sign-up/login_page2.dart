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
  bool _obscureText=true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xfff5f5f9),

      body: SingleChildScrollView(
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
              const SizedBox(height: 30),

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
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: ref.read(loginRiverpod).email,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),

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
                        suffixIcon: GestureDetector(
                          onTap: (){
                          setState(() {
                            _obscureText=!_obscureText;
                          });
                        },
                        child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off,
                        ),
                        ),
                        border: InputBorder.none,
                        hintText: "Password",
                      ),
                        obscureText: _obscureText,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),

              //Login button and (register now)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  padding: EdgeInsets.all(25),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                            )
                        ),
                        backgroundColor: MaterialStatePropertyAll<Color>(Theme.of(context).primaryColor),
                    ),
                    onPressed: () => ref.read(loginRiverpod).fetch(),
                    child: const Text("Giriş Yap",
                    style: TextStyle(
                      fontSize: 20,
                    ),),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.only(left: 55.0),
                child: Row(
                  children: [
                    Text('Üye değil misiniz?',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Segoe_UI',
                        color: Theme.of(context).primaryColorLight,

                      ),
                    ),
                    TextButton(onPressed:() => Navigator.pushNamed(context,'/sign-up' ),
                      child: Text(
                        'Olmak için tıklayın',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Segoe_UI',
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
