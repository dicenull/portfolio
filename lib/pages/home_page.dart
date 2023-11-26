import 'package:app/gen/assets.gen.dart';
import 'package:app/models/work_provider.dart';
import 'package:app/models/work_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
                child: const Text(
                  'dicenull',
                  style: TextStyle(
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
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

class _Body extends ConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: _WindowList(),
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
        itemBuilder: (context, index) => Container(
          alignment: Alignment.center,
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

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Tags(state.tag),
          Container(
            padding: const EdgeInsets.all(16),
            constraints: const BoxConstraints(
              maxWidth: 640,
              maxHeight: 320,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: scheme.primary),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(state.title, style: textTheme.displayMedium),
                Text(state.description, style: textTheme.bodyMedium),
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: (state.image == null)
                        ? const SizedBox.shrink()
                        : CachedNetworkImage(
                            placeholder: (_, __) =>
                                const CircularProgressIndicator(),
                            errorWidget: (_, __, ___) =>
                                const Icon(Icons.error),
                            imageUrl: state.image!.src,
                          ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: _Time(state.date),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: _SourceCodeButton(state.sourceUrl),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: _AppUrlButton(state.appUrl, state.genre),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Time extends StatelessWidget {
  const _Time(this.time);

  final DateTime time;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return RichText(
      text: TextSpan(
        style: textTheme.headlineMedium,
        children: [
          TextSpan(
            text: '${time.year}',
            style: textTheme.headlineSmall,
          ),
          TextSpan(
            text: '/',
            style: textTheme.headlineSmall,
          ),
          TextSpan(
            text: '${time.month}',
            style: textTheme.headlineLarge,
          ),
        ],
      ),
    );
  }
}

class _Tags extends StatelessWidget {
  const _Tags(this.tags);

  final List<Tag> tags;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: tags.map((tag) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: ShapeDecoration(
              color: Theme.of(context).colorScheme.tertiary,
              shape: const StadiumBorder(),
            ),
            child: Text(
              tag.name,
              style: TextStyle(color: Theme.of(context).colorScheme.onTertiary),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _SourceCodeButton extends StatelessWidget {
  const _SourceCodeButton(this.url);

  final String url;

  @override
  Widget build(BuildContext context) {
    const size = 64.0;

    if (url.isEmpty) {
      return const SizedBox.shrink();
    }

    return OutlinedButton.icon(
      onPressed: () {
        if (url.isEmpty) return;
        launchUrl(Uri.parse(url));
      },
      icon: const Icon(
        Icons.code,
      ),
      label: const Text(
        'ソースコード',
      ),
    );
  }
}

class _AppUrlButton extends StatelessWidget {
  const _AppUrlButton(this.url, this.genre);

  final String url;
  final Genre genre;

  @override
  Widget build(BuildContext context) {
    if (url.isEmpty) {
      return const SizedBox.shrink();
    }

    return OutlinedButton.icon(
      onPressed: () {
        if (url.isEmpty) return;
        launchUrl(Uri.parse(url));
      },
      icon: Icon(
        switch (genre) {
          Genre.document => Icons.article,
          Genre.app => Icons.rocket_launch,
          Genre.game => Icons.gamepad,
        },
      ),
      label: Text(
        switch (genre) {
          Genre.document => 'ドキュメント',
          Genre.app => 'アプリ',
          Genre.game => 'ゲーム',
        },
      ),
    );
  }
}
