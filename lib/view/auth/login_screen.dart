import 'package:flutter/material.dart';
import 'package:job_ghar/core/constant/app_color.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        const Spacer(flex: 2),
                        Container(
                          height: 500,
                          width: double.maxFinite,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: AppColor.secondaryBackground,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Login to JobGhar",
                                style: TextStyle(
                                  color: AppColor.secondary,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Form(
                                key: _formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextFormField(
                                      controller: _emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: AppColor.secondary,
                                      ),
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                              horizontal: 10,
                                              vertical: 15,
                                            ),
                                        prefixIcon: Icon(
                                          Icons.email_outlined,
                                          color: AppColor.secondary,
                                        ),
                                        labelText: "Email",
                                        labelStyle: const TextStyle(
                                          fontSize: 16,
                                          color: AppColor.secondary,
                                        ),
                                        floatingLabelStyle: const TextStyle(
                                          fontSize: 16,
                                          color: AppColor.secondary,
                                        ),
                                        filled: true,
                                        fillColor: AppColor.primary,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          borderSide: const BorderSide(
                                            color: AppColor.secondary,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          borderSide: BorderSide(
                                            color: AppColor.secondary,
                                          ),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          borderSide: const BorderSide(
                                            color: AppColor.primaryRed,
                                            width: 2,
                                          ),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          borderSide: const BorderSide(
                                            color: AppColor.primaryRed,
                                          ),
                                        ),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.auto,
                                      ),
                                    ),
                                    const SizedBox(height: 25),
                                    TextFormField(
                                      controller: _passwordController,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      obscureText: _obscureText,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: AppColor.secondary,
                                      ),
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                              horizontal: 10,
                                              vertical: 15,
                                            ),
                                        prefixIcon: Icon(
                                          Icons.lock_outline,
                                          color: AppColor.secondary,
                                        ),
                                        labelText: "Password",
                                        labelStyle: const TextStyle(
                                          fontSize: 15,
                                          color: AppColor.secondary,
                                        ),
                                        floatingLabelStyle: const TextStyle(
                                          fontSize: 15,
                                          color: AppColor.secondary,
                                        ),
                                        filled: true,
                                        fillColor: AppColor.primary,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          borderSide: const BorderSide(
                                            color: AppColor.secondary,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          borderSide: BorderSide(
                                            color: AppColor.secondary,
                                          ),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          borderSide: const BorderSide(
                                            color: AppColor.primaryRed,
                                            width: 2,
                                          ),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          borderSide: const BorderSide(
                                            color: AppColor.primaryRed,
                                          ),
                                        ),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.auto,
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            _obscureText
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _obscureText = !_obscureText;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(flex: 2),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

Widget _buildTextFormField({
  required TextEditingController controller,
  required TextInputType keyboardType,
  required String labelText,
  required IconData icon,
  String? Function(String?)? validator,
  bool obscureText = false,
  Widget? suffixIcon,
}) {
  return Container(
    margin: EdgeInsets.only(top: 20),
    child: TextFormField(
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: const TextStyle(fontSize: 15, color: AppColor.secondary),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 15,
        ),
        prefixIcon: Icon(icon),
        labelText: labelText,
        labelStyle: const TextStyle(fontSize: 15, color: AppColor.secondary),
        floatingLabelStyle: const TextStyle(
          fontSize: 15,
          color: AppColor.secondary,
        ),
        filled: true,
        fillColor: AppColor.primary,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColor.secondary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColor.secondary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColor.primaryRed, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColor.primaryRed),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        suffixIcon: suffixIcon
      ),
    ),
  );
}
