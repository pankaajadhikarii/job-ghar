import 'package:flutter/material.dart';
import 'package:job_ghar/core/constant/app_color.dart';
import 'package:job_ghar/widgets/custom_text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscureText = false;
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
                          height: 450,
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
                                "Signup to JobGhar",
                                style: TextStyle(
                                  color: AppColor.secondary,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Form(
                                key: _formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    customTextFormField(
                                      controller: _nameController,
                                      keyboardType: TextInputType.text,
                                      labelText: "Name",
                                      icon: Icons.person,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return ("Name is requird");
                                        }
                                        return null;
                                      },
                                    ),
                                    customTextFormField(
                                      controller: _emailController,
                                      keyboardType: TextInputType.text,
                                      labelText: "Email",
                                      icon: Icons.email_outlined,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return ("Email is requird");
                                        }
                                        return null;
                                      },
                                    ),
                                    customTextFormField(
                                      controller: _passwordController,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      labelText: "Password",
                                      icon: Icons.lock_outline,
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
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Password is required";
                                        }
                                        return null;
                                      },
                                    ),
                                    customTextFormField(
                                      controller: _confirmPasswordController,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      labelText: "Confirm Password",
                                      icon: Icons.lock_outline,
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
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Password is required";
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(height: 40),
                                    SizedBox(
                                      height: 50,
                                      width: double.maxFinite,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColor.secondary,
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          "Signup",
                                          style: TextStyle(
                                            color: AppColor.primary,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 17,
                                          ),
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