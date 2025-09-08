import 'package:flutter/material.dart';
import 'package:http_reqest/widget/example/example_model.dart';

class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  final model = ExampleWidgetModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ExampleModelProvider(
          model: model, 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const _ReloadButton(),
              const _CreateButton(),
              const Expanded(
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                  child: _PostsWidget(),))
            ],
          ),)),
    );
  }
}

class _ReloadButton extends StatelessWidget {
  const _ReloadButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => ExampleModelProvider.read(context)?.model.reloadPosts(), 
      child: const Text('ОБновить посты'));
  }
}
class _CreateButton extends StatelessWidget {
  const _CreateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => ExampleModelProvider.read(context)?.model.createPost(), 
      child: const Text('Создать пост'));
  }
}

class _PostsWidget extends StatelessWidget {
  const _PostsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ExampleModelProvider.watch(context)?.model.posts.length ?? 0,
      itemBuilder: (BuildContext context, int index){
        return _PostsRowWidget(index: index);
      });
  }
}

class _PostsRowWidget extends StatelessWidget {
  final int index;
  const _PostsRowWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final post = ExampleModelProvider.read(context)!.model.posts[index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(post.id.toString()),
        const SizedBox(height: 10,),
        Text(post.title),
        const SizedBox(height: 10,),
        Text(post.body),
        const SizedBox(height: 40,)

      ],
    );
  }
}