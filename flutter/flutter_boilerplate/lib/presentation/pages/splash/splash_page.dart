import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/presentation/pages/auth/sign_in_page.dart';
import 'package:flutter_boilerplate/presentation/pages/home/home_page.dart';
import 'package:flutter_boilerplate/presentation/providers/auth/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(authProvider, (_, next) {
      next.whenData((authState) {
        if (authState.isAuthenticated) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const HomePage()),
          );
        } else {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const SignInPage()),
          );
        }
      });
    });

    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
