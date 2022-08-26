import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pattern_set_state/services/http_service.dart';

import '../models/post_model.dart';
import 'list_post_state.dart';

class ListPostCubit extends Cubit<ListPostState>{
  ListPostCubit():super(ListPostInit());

  void apiPostList() async {
    emit(ListPostLoading());
    final response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if (kDebugMode) {
      print(response);
    }
    if(response != null){
      emit(ListPostLoaded(posts: Network.parsePostList(response)));
    }else{
      emit(ListPostError(error: "Couldn't fetch posts"));
    }
  }

  void apiPostDelete(Post post) async {
    emit(ListPostLoading());
    final response = await Network.DEL(
        Network.API_DELETE + post.id.toString(), Network.paramsEmpty());
    print(response);
    if (response != null) {
      apiPostList();
    } else {
      emit(ListPostError(error: "Couldn't delete post"));
    }
  }
}