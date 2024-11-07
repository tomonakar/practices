import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/presentation/pages/home/widgets/user_profile_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_boilerplate/presentation/providers/auth/auth_provider.dart';
import 'package:flutter_boilerplate/presentation/pages/auth/sign_in_page.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await ref.read(authProvider.notifier).signOut();
              if (context.mounted) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const SignInPage()),
                );
              }
            },
          ),
        ],
      ),
      body: authState.when(
        data: (state) => state.user != null
            ? UserProfileView(user: state.user!)
            : const Center(child: Text('ユーザー情報が見つかりません')),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(
          child: Text('エラーが発生しました: $error'),
        ),
      ),
    );
  }
}
