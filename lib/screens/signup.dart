import 'package:flutter/material.dart';
import 'package:macha/screens/home.dart';

class SignUp extends StatefulWidget {
  final VoidCallback show;
  const SignUp({super.key, required this.show});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();

  final email = TextEditingController();
  final password = TextEditingController();
  final passwordConfirm = TextEditingController();
  bool visible = false;

  @override
  void initState() {
    super.initState();
    _focusNode1.addListener(() {
      setState(() {});
    });
    _focusNode2.addListener(() {
      setState(() {});
    });
    _focusNode3.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode1.dispose();
    _focusNode2.dispose();
    _focusNode3.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: [
            logo(),
            const SizedBox(height: 0),
            textfildEmail(),
            const SizedBox(height: 15),
            textfildPassword(),
            const SizedBox(height: 15),
            textfildPasswordConfirm(),
            const SizedBox(height: 8),
            have(),
            const SizedBox(height: 20),
            singUp(),
            const SizedBox(height: 15),
            orDivider(),
            const SizedBox(height: 15),
            withGoogle(),
            const SizedBox(height: 15),
            withApple(),
          ],
        ),
      ),
    );
  }

  Row orDivider() {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            thickness: 1.5,
            endIndent: 4,
            indent: 20,
          ),
        ),
        Text(
          "O",
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
          ),
        ),
        const Expanded(
          child: Divider(
            thickness: 1.5,
            endIndent: 20,
            indent: 4,
          ),
        ),
      ],
    );
  }

  Padding singUp() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      /* changed child: Container() to Stack() with children
        for fake sign up */
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              "Registrar",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: const Color.fromARGB(0, 0, 0, 0),
              borderRadius: BorderRadius.circular(10),
            ),
            child: GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => const Home(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding withGoogle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          leading: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Image.asset(
              'assets/images/logoG.svg',
              height: 30,
            ),
          ),
          title: const Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Text(
              "Continuar con Google",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
          ),
          trailing: const Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Icon(
              Icons.arrow_right,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Padding withApple() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const ListTile(
          leading: Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Icon(
                Icons.facebook,
                color: Colors.black,
              )),
          title: Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Text(
              "Continuar con Facebook",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
          ),
          trailing: Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Icon(
              Icons.arrow_right,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Padding have() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "¿Ya tiene cuenta? ",
            style: TextStyle(color: Colors.grey[700], fontSize: 14),
          ),
          GestureDetector(
            onTap: widget.show,
            child: const Text(
              "Entrar",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Padding textfildEmail() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
          controller: email,
          focusNode: _focusNode1,
          decoration: InputDecoration(
            hintText: 'correo',
            prefixIcon: Icon(
              Icons.email,
              color: _focusNode1.hasFocus ? Colors.black : Colors.grey[600],
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Color(0xffc5c5c5),
                width: 2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                width: 2,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding textfildPassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
          controller: password,
          focusNode: _focusNode2,
          obscureText: visible,
          obscuringCharacter: '*',
          decoration: InputDecoration(
            hintText: 'contraseña',
            prefixIcon: Icon(
              Icons.key,
              color: _focusNode2.hasFocus ? Colors.black : Colors.grey[600],
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Color(0xffc5c5c5),
                width: 2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                width: 2,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding textfildPasswordConfirm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
          controller: passwordConfirm,
          focusNode: _focusNode3,
          obscureText: visible,
          obscuringCharacter: '*',
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  visible = !visible;
                });
              },
              child: Icon(
                visible ? Icons.visibility_off : Icons.visibility,
                color: _focusNode3.hasFocus ? Colors.black : Colors.grey[600],
              ),
            ),
            hintText: 'confirmar contraseña',
            prefixIcon: Icon(
              Icons.key,
              color: _focusNode3.hasFocus ? Colors.black : Colors.grey[600],
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Color(0xffc5c5c5),
                width: 2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                width: 2,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding logo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: Image.asset('assets/images/logo2.png'),
    );
  }
}
