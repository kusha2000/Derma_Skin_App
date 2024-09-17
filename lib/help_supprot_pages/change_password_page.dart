import 'package:derma_skin_app/Pages/Account.dart';
import 'package:derma_skin_app/helpers/snackbar.dart';
import 'package:flutter/material.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password'),
        backgroundColor: Color(0xFF607C6D),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _currentPasswordController,
                obscureText: true,
                decoration:
                    const InputDecoration(labelText: 'Current Password'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    AppHelpers.showSnackBar(
                        context, "Please Enter Current Password");
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _newPasswordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'New Password'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    AppHelpers.showSnackBar(
                        context, "Please Enter new Password");
                  } else if (value.length < 6) {
                    AppHelpers.showSnackBar(context,
                        "Password should be at least 6 characters long");
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration:
                    const InputDecoration(labelText: 'Confirm New Password'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    AppHelpers.showSnackBar(
                        context, "Please Enter Confirm Password");
                  } else if (value != _newPasswordController.text) {
                    AppHelpers.showSnackBar(context, "Passwords do not match");
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            _isLoading = true;
                          });

                          Future.delayed(Duration(seconds: 2), () {
                            setState(() {
                              _isLoading = false;
                            });

                            AppHelpers.showSnackBar(
                                context, "Password Change Succesfully");

                            _currentPasswordController.clear();
                            _newPasswordController.clear();
                            _confirmPasswordController.clear();
                          });
                        }

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Account()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF607C6D), // Button color
                      ),
                      child: const Text('Change Password'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
