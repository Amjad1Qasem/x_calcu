import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class BiometricAuthScreen extends StatefulWidget {
  const BiometricAuthScreen({super.key});

  @override
  State<BiometricAuthScreen> createState() => _BiometricAuthScreenState();
}

class _BiometricAuthScreenState extends State<BiometricAuthScreen> {
  final LocalAuthentication _localAuth = LocalAuthentication();
  String _authStatus = '';

  @override
  void initState() {
    super.initState();
    _checkBiometricsAndAuthenticate();
  }

  Future<void> _checkBiometricsAndAuthenticate() async {
    try {
      final bool isDeviceSupported = await _localAuth.isDeviceSupported();
      final bool canCheckBiometrics = await _localAuth.canCheckBiometrics;

      if (!isDeviceSupported || !canCheckBiometrics) {
        setState(() {
          _authStatus = 'Biometric authentication not available.';
        });
        return;
      }

      final bool authenticated = await _localAuth.authenticate(
        localizedReason: 'Please authenticate to access your account',
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
      );

      if (authenticated) {
        setState(() => _authStatus = 'Authentication successful');
        // Navigate to home screen or unlock app
        Navigator.pushReplacementNamed(context, '/home'); // <-- adjust this route
      } else {
        setState(() => _authStatus = 'Authentication failed');
      }
    } catch (e) {
      setState(() => _authStatus = 'Error: ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _authStatus.isEmpty
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.fingerprint, size: 64, color: Theme.of(context).primaryColor),
                  const SizedBox(height: 20),
                  Text(_authStatus, style: const TextStyle(fontSize: 18)),
                  const SizedBox(height: 30),
                  ElevatedButton.icon(
                    onPressed: _checkBiometricsAndAuthenticate,
                    icon: const Icon(Icons.lock_open),
                    label: const Text('Try Again'),
                  ),
                ],
              ),
      ),
    );
  }
}
