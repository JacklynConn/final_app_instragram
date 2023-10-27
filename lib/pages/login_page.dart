import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: _buildBody),
    );
  }

  Widget get _buildBody {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.purpleAccent,
            Colors.red,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildLoginPanel,
            _buildSignUp,
          ],
        ),
      ),
    );
  }

  Widget get _buildLoginPanel {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildTitle,
          _buildUsernameTextField,
          _buildPasswordTextField,
          _buildLoginButton,
          _buildForgotLoginTextLink,
          _buildOrDividerOr,
          _buildLoginWithFacebook,
        ],
      ),
    );
  }

  Widget get _buildTitle {
    return const Text(
      "Instagram",
      style: TextStyle(
        fontSize: 50,
        fontFamily: "Vegas",
        color: Colors.white,
      ),
    );
  }

  Widget get _buildUsernameTextField {
    return const SizedBox(
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        autocorrect: false,
        decoration: InputDecoration(
          hintText: "Username",
          hintStyle: TextStyle(
            color: Colors.white,
          ),
          filled: true,
          isDense: true,
          fillColor: Colors.white24,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide.none,
          ),
        ),
        obscureText: false,
      ),
    );
  }

  bool hidePassword = true;

  Widget get _buildPasswordTextField {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: TextField(
        keyboardType: TextInputType.text,
        autocorrect: false,
        decoration: InputDecoration(
          hintText: "Password",
          hintStyle: const TextStyle(
            color: Colors.white,
          ),
          filled: true,
          isDense: true,
          fillColor: Colors.white24,
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  hidePassword = !hidePassword;
                });
              },
              icon: Icon(
                hidePassword ? Icons.visibility_off : Icons.visibility,
                color: Colors.white,
              )),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide.none,
          ),
        ),
        obscureText: hidePassword,
      ),
    );
  }

  Widget get _buildLoginButton {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: 400,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {},
        child: const Text(
          "Login",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueAccent),
        ),
      ),
    );
  }

  Widget get _buildForgotLoginTextLink {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Forgot Login details?",
          style: TextStyle(color: Colors.white),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            "Get help signing in.",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget get _buildOrDividerOr {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            color: Colors.white,
            height: 1
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "OR",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: Colors.white,
            height: 1,
          ),
        ),
      ],
    );
  }

  Widget get _buildLoginWithFacebook {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: 400,
      height: 50,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.facebook),
        label: const Text("Login with Facebook"),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
  Widget get _buildSignUp{
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Don't have an account?",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Sign up.",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
