import 'package:flutter/material.dart';
import 'package:form_fields/helper/app_regex.dart';
import 'package:form_fields/widgets/custom_button_widget.dart';
import 'package:form_fields/widgets/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  bool _obscurePassword = true;
  double _progress = 0.0;

@override
  void initState() {
    super.initState();
    _emailController.addListener(_updateProgress);
    _passController.addListener(_updateProgress);
  }


  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

void _updateProgress() {
    double progress = 0.0;

    if (_emailController.text.isNotEmpty) {
      progress += 0.5; 
    }
    if (_passController.text.isNotEmpty) {
      progress += 0.5; 
    }

    setState(() {
      _progress = progress;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F2321),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Stack(
            children: [
              Positioned(
                top: -50,
                left: 140,
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFF00BDA4).withOpacity(0.05),
                  ),
                ),
              ),
              Positioned(
                top: 584,
                left: -100,
                child: Container(
                  width: 400,
                  height: 400,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFF00BDA4).withOpacity(0.05),
                  ),
                ),
              ),

              Positioned.fill(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.shield,
                            size: 30,
                            color: const Color(0xff00BDA4),
                          ),
                          const Text(
                            'System Node 01',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Icon(
                            Icons.sensors,
                            size: 40,
                            color: const Color(0xff00BDA4),
                          ),
                        ],
                      ),
                      const SizedBox(height: 80),

                      Column(
                        children: const [
                          SizedBox(
                            width: 80,
                            height: 80,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: Color(0xFF00BDA4),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              child: Icon(
                                Icons.lock_outline,
                                color: Colors.tealAccent,
                                size: 60,
                              ),
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Secure Terminal',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            'Encryption Protocol Alpha-7',
                            style: TextStyle(
                              color: Color(0xff00BDA4),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Text(
                              "Access email",
                              style: TextStyle(color: Color(0xff00BDA499)),
                            ),
                            CustomTextField(
                              hintText: "Enter Email",
                              controller: _emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Email is required";
                                } else if (!Validator.isValidEmail(value)) {
                                  return "Enter a valid email";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            Text(
                              "Password",
                              style: TextStyle(color: Color(0xff00BDA499)),
                            ),
                            CustomTextField(
                              prefixIcon: Icon(Icons.lock),
                              hintText: "secretpass",
                              controller: _passController,
                              isPassword: _obscurePassword,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Password is required";
                                } else if (!Validator.isValidPassword(value)) {
                                  return "Password must be 8+ chars, include upper, lower, number & symbol";
                                }
                                return null;
                              },
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscurePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: const Color(0xff00BDA4),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscurePassword = !_obscurePassword;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(height: 30),

                            PrimaryButtonWidget(
                              buttonText: "Authenticate",
                              onPress: () {
                                if (_formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Access Granted"),
                                    ),
                                  );
                                }
                              },
                            ),
                            const SizedBox(height: 20),

                            const Text(
                              "Forgot Credentials?",
                              style: TextStyle(
                                color: Colors.tealAccent,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            const SizedBox(height: 100),

                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 10,
                                      height: 10,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.green,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    const Text(
                                      "Connection: Encrypted TLS 1.3",
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                SizedBox(
                                  width: 200,
                                  child: LinearProgressIndicator(
                                    value: _progress,
                                    backgroundColor: Colors.white12,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Color(0xff00BDA4),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
