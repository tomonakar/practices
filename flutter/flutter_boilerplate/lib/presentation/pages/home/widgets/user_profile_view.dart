import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/domain/entities/user/user.dart';

class UserProfileView extends StatelessWidget {
  final User user;

  const UserProfileView({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (user.profileImageUrl != null)
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(user.profileImageUrl!),
              ),
            ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'プロフィール情報',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text('名前'),
                    subtitle: Text(user.name),
                  ),
                  ListTile(
                    leading: const Icon(Icons.email),
                    title: const Text('メールアドレス'),
                    subtitle: Text(user.email),
                  ),
                  ListTile(
                    leading: const Icon(Icons.calendar_today),
                    title: const Text('アカウント作成日'),
                    subtitle: Text(user.createdAt.toString()),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
