import 'package:flutter/material.dart';
import 'package:coba_dart/services/api_service.dart'; // Pastikan sudah import ApiService
import 'package:coba_dart/models/user.dart'; // Pastikan sudah ada model User
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ApiService _apiService = ApiService();

  bool _isLoading = false;

  // Fungsi untuk login
  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final user = await _apiService.login(
        _usernameController.text,
        _passwordController.text,
      );

      if (user != null) {
        // Arahkan ke halaman home
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen(user: user)),
        );
      } else {
        _showErrorMessage('Login failed');
      }
    } catch (e) {
      _showErrorMessage(e.toString());
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Fungsi untuk register
  Future<void> _register() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final user = await _apiService.register(
        _usernameController.text,
        _passwordController.text,
      );

      if (user != null) {
        _showSuccessMessage('Registration successful');
      } else {
        _showErrorMessage('Registration failed');
      }
    } catch (e) {
      _showErrorMessage(e.toString());
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Menampilkan pesan error
  void _showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  // Menampilkan pesan sukses
  void _showSuccessMessage(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Success'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 20),
            _isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _login,
                    child: Text('Login'),
                  ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _register,
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
