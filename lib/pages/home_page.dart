import 'dart:js' as js;
import 'dart:math';
import 'dart:ui' as ui;

import 'package:app/gen/assets.gen.dart';
import 'package:app/models/work_provider.dart';
import 'package:app/models/work_state.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

final scrollAmount = StateProvider((ref) => 0.0);
final filterTextProvider = StateProvider((ref) => '');

bool get isCanvasKit => js.context['flutterCanvasKit'] != null;

final shaderProgram = FutureProvider(
  (ref) => ui.FragmentProgram.fromAsset('assets/shaders/simple.frag'),
);

final selectedGenre = StateProvider<Set<Genre>>((ref) => {Genre.all});

final filteredWorkProvider =
    Provider.autoDispose<AsyncValue<List<WorkState>>>((ref) {
  final all = ref.watch(fetchWorkProvider);
  final filterText = ref.watch(filterTextProvider);
  final selectedGenres = ref.watch(selectedGenre);

  return all.maybeWhen(
    data: (data) {
      final filteredData = data
          .where((e) => e.compressText.contains(filterText))
          .where((e) =>
              selectedGenres.contains(Genre.all) ||
              selectedGenres.contains(e.genre))
          .toList();
      return AsyncValue.data(filteredData);
    },
    orElse: () => all,
  );
});

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final amount = ref.watch(scrollAmount);

    return SelectionArea(
      child: Scaffold(
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
        body: CustomPaint(
          painter: ref.watch(shaderProgram).maybeWhen(
                data: (program) {
                  if (!isCanvasKit) return null;

                  return ShaderPainter(
                    shader: program.fragmentShader(),
                    amount: amount,
                  );
                },
                orElse: () => null,
              ),
          child: const _Body(),
        ),
      ),
    );
  }
}

class ShaderPainter extends CustomPainter {
  ShaderPainter({required this.shader, required this.amount});
  ui.FragmentShader shader;
  double amount;

  @override
  void paint(Canvas canvas, Size size) {
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    shader.setFloat(2, amount);

    final paint = Paint()
      ..shader = shader
      ..blendMode = BlendMode.multiply;
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant ShaderPainter oldDelegate) {
    return oldDelegate.amount != amount;
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

class _WindowList extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredState = ref.watch(filteredWorkProvider);

    final controller = useScrollController();
    callback() {
      ref.read(scrollAmount.notifier).state = controller.offset * .0001;
    }

    useEffect(() {
      controller.addListener(callback);
      return () => controller.removeListener(callback);
    }, [controller]);

    return filteredState.when(
      data: (data) {
        return Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16),
              child: _ControlPanel(),
            ),
            SegmentedButton<Genre>(
              segments: Genre.values
                  .map(
                    (e) => ButtonSegment(
                      value: e,
                      icon: Icon(e.toData().$1),
                      label: Text(e.toData().$2),
                    ),
                  )
                  .toList(),
              selected: ref.watch(selectedGenre),
              onSelectionChanged: (newSelection) {
                ref.read(selectedGenre.notifier).state = newSelection;
              },
            ),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: data.length,
                controller: controller,
                itemBuilder: (context, index) => Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(16),
                  child: _Window(data[index]),
                ),
              ),
            ),
          ],
        );
      },
      loading: () => const CircularProgressIndicator(),
      error: (error, stackTrace) {
        print('$error,\n $stackTrace');
        return const Text('ERROR');
      },
    );
  }
}

class _ControlPanel extends HookConsumerWidget {
  const _ControlPanel();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allCount = ref.watch(fetchWorkProvider).asData?.value.length;
    final filterCount = ref.watch(filteredWorkProvider).asData?.value.length;

    if (allCount == null || filterCount == null) return const SizedBox.shrink();

    final width = max(MediaQuery.of(context).size.width * .5, 500.0);
    final controller = useTextEditingController();
    final textTheme = Theme.of(context).textTheme;

    useEffect(() {
      listener() {
        ref.read(filterTextProvider.notifier).state = controller.text.trim();
      }

      controller.addListener(listener);

      return () => controller.removeListener(listener);
    }, const []);

    return Container(
      constraints: BoxConstraints(maxWidth: width),
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: controller,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10))),
              Row(
                children: [
                  Text(
                    '$filterCount/$allCount',
                    style: textTheme.headlineMedium,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
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
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(2),
                child: _Platform(state.platform),
              ),
              _Tags(state.tag),
            ],
          ),
          Material(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: scheme.primary,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            color: scheme.background,
            child: InkWell(
              onTap: () {
                final url = state.appUrl;
                final label = state.genre.name;
                if (url.isEmpty) return;

                FirebaseAnalytics.instance.logEvent(
                    name: 'openAppUrl',
                    parameters: {'url': url, 'genre': label});
                launchUrl(Uri.parse(url));
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                constraints: const BoxConstraints(
                  maxWidth: 640,
                  maxHeight: 400,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: AutoSizeText(
                        state.title,
                        maxLines: 2,
                        style: textTheme.displayMedium,
                      ),
                    ),
                    AutoSizeText(state.description,
                        style: textTheme.bodyMedium),
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
            ),
          ),
          Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: _Time(state.date),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: _SourceCodeButton(state.sourceUrl),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Platform extends StatelessWidget {
  const _Platform(this.platform);

  final Platform platform;

  @override
  Widget build(BuildContext context) {
    final (icon, label) = switch (platform) {
      Platform.web => (Icons.web, 'Webアプリ'),
      Platform.android => (Icons.android, 'Androidアプリ'),
      Platform.windows => (Icons.laptop_windows, 'Windowsアプリ'),
      Platform.vr => (Icons.view_in_ar, 'VRアプリ'),
      Platform.physics => (Icons.description, 'ドキュメント'),
    };
    final scheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: scheme.tertiary,
        ),
        const SizedBox(width: 2),
        Text(
          label,
          style: TextStyle(color: scheme.tertiary),
        ),
      ],
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

        FirebaseAnalytics.instance
            .logEvent(name: 'openSourceCode', parameters: {'url': url});
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
