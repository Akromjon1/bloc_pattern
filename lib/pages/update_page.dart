import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/scheduler.dart';
import 'package:pattern_set_state/blocks/list_post_cubit.dart';
import 'package:pattern_set_state/main.dart';

import '../blocks/update_post_cubit.dart';
import '../blocks/update_post_state.dart';
import '../models/post_model.dart';
import '../views/item_of_update.dart';

class UpdatePage extends StatefulWidget {
  Post? post;

  UpdatePage({Key? key, this.post}) : super(key: key);

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  _finish(context) {
    SchedulerBinding.instance.addPostFrameCallback((_)=> Navigator.pop(context,"resultsss"),
    );

    }

  @override
  void initState() {
    super.initState();
    titleController.text = widget.post!.fullname;
    bodyController.text = widget.post!.mobile;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdatePostCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Update a Post"),
        ),
        body: BlocBuilder<UpdatePostCubit, UpdatePostState>(
          builder: (BuildContext context, UpdatePostState state) {
            if (state is UpdatePostLoading) {
              String title = titleController.text.toString();
              String body = bodyController.text.toString();
              Post post = Post(
                  id: widget.post!.id,
                  fullname: title,
                  mobile: body,
                  );
              return viewOfUpdate(
                  true, context, post, titleController, bodyController);
            }
            if (state is UpdatePostLoaded) {
              _finish(context);
            }
            if (state is UpdatePostError) {}
            return viewOfUpdate(
                false, context, widget.post!, titleController, bodyController);
          },
        ),
      ),
    );
  }
}