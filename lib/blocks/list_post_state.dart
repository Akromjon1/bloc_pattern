import 'package:equatable/equatable.dart';
import 'package:pattern_set_state/models/post_model.dart';

abstract class ListPostState extends Equatable{

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ListPostInit extends ListPostState{

}

class ListPostLoading extends ListPostState{}

class ListPostLoaded extends ListPostState{
  final List<Post> posts;
  bool? isDeleted;

  ListPostLoaded({required this.posts, this.isDeleted});
}

class ListPostError extends ListPostState{
  final error;

  ListPostError({required this.error});
}
