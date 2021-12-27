part of 'posts_cubit.dart';

abstract class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object> get props => [];
}

class PostsInitial extends PostsState {}

class PostLoadingState extends PostsState {
  final String loadMessage;
  PostLoadingState({
    required this.loadMessage,
  });
  List<Object> get props => [loadMessage];
}

class PostErrorState extends PostsState {
  final String errorMessage;
  PostErrorState({
    required this.errorMessage,
  });
  List<Object> get props => [errorMessage];
}

class PostFetchSuccessState extends PostsState {
  final List<NewPosts> data;
  final String? successMessage;
  PostFetchSuccessState({
    required this.data,
    this.successMessage,
  });
  List<Object> get props => [data];
}
