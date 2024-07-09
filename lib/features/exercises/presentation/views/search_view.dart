import 'package:flutter/material.dart';
import 'package:track_me_updated/features/exercises/presentation/views/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key, required this.onNavigate});
  final void Function(int) onNavigate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Search',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SearchViewBody(onNavigate: onNavigate),
    );
  }
}
