import 'package:app/gen/assets.gen.dart';
import 'package:app/models/work_provider.dart';
import 'package:app/models/work_state.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64),
        child: AppBar(
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Assets.icon.image(width: 64, height: 64),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'dicenull',
                  style: GoogleFonts.notoSans(
                    textStyle: const TextStyle(
                      fontSize: 64,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: const _Body(),
    );
  }
}

typedef Planet = ({String title, String description, String imgUrl});

class _Body extends ConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: _WindowList(),
          )
        ],
      ),
    );
  }
}

class _WindowList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(fetchWorkProvider);

    return state.when(
      data: (data) => ListView.builder(
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(16),
          child: _Window(data[index]),
        ),
      ),
      loading: () => const CircularProgressIndicator(),
      error: (error, stackTrace) {
        print('$error,\n $stackTrace');
        return const Text('ERROR');
      },
    );
  }
}

class _Window extends StatelessWidget {
  final WorkState state;

  const _Window(this.state);

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _SourceIcon(state.sourceUrl),
        Flexible(
          child: Container(
            padding: const EdgeInsets.all(32),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: scheme.primary),
              ),
              child: InkWell(
                onTap: () {
                  final url = state.appUrl;
                  launchUrl(Uri.parse(url));
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(state.title, style: textTheme.displayMedium),
                    Text(state.description, style: textTheme.bodyMedium),
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        constraints: const BoxConstraints(
                          maxWidth: 640,
                          maxHeight: 320,
                        ),
                        child: FadeInImage(
                          placeholder: Assets.icon.provider(),
                          image: Image.network(state.image.src).image,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SourceIcon extends StatelessWidget {
  const _SourceIcon(this.url);

  final String url;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    const size = 64.0;

    if (url.isEmpty) {
      return Container(
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: scheme.primary),
        width: size,
        height: size,
      );
    }

    return Material(
      child: InkWell(
        splashColor: scheme.onPrimary,
        customBorder: const CircleBorder(),
        onTap: () {
          if (url.isEmpty) return;
          launchUrl(Uri.parse(url));
        },
        child: Ink(
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: scheme.primary),
          width: size,
          height: size,
          child: const Icon(
            Icons.code,
            size: size * .7,
          ),
        ),
      ),
    );
  }
}

class _NoImage extends StatelessWidget {
  const _NoImage();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Assets.icon.image(
          width: 256,
          height: 256,
          opacity: const AlwaysStoppedAnimation(.1),
        ),
      ],
    );
  }
}
