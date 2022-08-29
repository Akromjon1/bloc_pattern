import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pattern_set_state/blocks/list_post_cubit.dart';
import 'package:pattern_set_state/blocks/list_post_state.dart';
import '../models/post_model.dart';
import '../views/home_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> items = [];
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ListPostCubit>(context).apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BloC Pattern"),
        centerTitle: true,
      ),
      body: BlocBuilder<ListPostCubit, ListPostState>(
        builder: (BuildContext context, ListPostState state) {
          if(state is ListPostError){
            return viewOfHome(items, true);
          }
          if(state is ListPostLoaded){
            items = state.posts;
            return viewOfHome(items, false);
          }
          return  viewOfHome(items, true);
        }
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () =>
          BlocProvider.of<ListPostCubit>(context).callCreatePage(context),
        child: const Icon(Icons.add),
      ),
    );
  }

}
