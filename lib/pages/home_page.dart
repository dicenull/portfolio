import 'package:app/gen/assets.gen.dart';
import 'package:app/models/work_provider.dart';
import 'package:app/models/work_state.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: _Body(),
    );
  }
}

typedef Planet = ({String title, String description, String imgUrl});

class _Body extends ConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaSize = MediaQuery.of(context).size;
    final iconSize = mediaSize.height * .4;
    final qrSize = mediaSize.height * .3;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.icon.image(width: iconSize, height: iconSize),
          Text(
            'dicenull',
            style: GoogleFonts.notoSansJavanese(
              textStyle: const TextStyle(
                fontSize: 64,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
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

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: scheme.primary,
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(state.title, style: textTheme.displayMedium),
          if (state.image != null)
            Flexible(
              child: FadeInImage(
                placeholder: Assets.icon.provider(),
                image: Image.network(state.image!.src).image,
              ),
            ),
          if (state.description != null)
            Text(state.description!, style: textTheme.bodyMedium),
        ],
      ),
    );
  }
}
