import 'package:flutter/material.dart';
import 'package:twitter_embed_card/src/svg_asset.dart';
import 'package:twitter_embed_card/src/vector_icon.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16.0),
          // Use Center as layout has unconstrained width (loose constraints),
          // together with SizedBox to specify the max width (tight constraints)
          // See this thread for more info:
          // https://twitter.com/biz84/status/1445400059894542337
          child: Center(
            child: SizedBox(
              width: 600, // max allowed width
              child: TwitterEmbedCard(),
            ),
          ),
        ),
      ),
    );
  }
}

class TwitterEmbedCard extends StatelessWidget {
  const TwitterEmbedCard({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Delete this and implement the desired layout
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Use the icons below to build the completed layout',
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32.0),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: SvgAsset.values
              .map((asset) => VectorIcon(
                    asset: asset,
                    height: 50,
                  ))
              .toList(),
        ),
      ],
    );
  }
}
