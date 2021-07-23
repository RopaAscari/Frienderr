class PostState {
  PostState();

  List<Object> get props => [];
}

class PostLiked extends PostState {}

class PostUnLiked extends PostState {}

class LikeFailure extends PostState {
  final String error;

  LikeFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LikeFailure { error: $error }';
}

class UnLikeFailure extends PostState {
  final String error;

  UnLikeFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'UnLikeFailure { error: $error }';
}

class DeleteSuccess extends PostState {}

class DeleteFailure extends PostState {
  final String error;

  DeleteFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'UnLikeFailure { error: $error }';
}
