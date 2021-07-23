import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

abstract class FriendsEvent extends Equatable {
  FriendsEvent();
}

class GetFriends extends FriendsEvent {
  final String id;
  GetFriends({required this.id});

  @override
  List<Object> get props => [id];
}
