import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;
    final iconSize = mediaSize.width * .3;
    final qrSize = mediaSize.width * .1;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.icon.image(width: iconSize, height: iconSize),
          Text(
            'dicenull',
            style: GoogleFonts.notoSansJavanese(
              textStyle: const TextStyle(fontSize: 64),
            ),
          ),
          QrImageView(data: Uri.base.toString(), size: qrSize),
        ],
      ),
    );
  }
}
