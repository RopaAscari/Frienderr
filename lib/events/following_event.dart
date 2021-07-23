import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

abstract class FollowingEvent extends Equatable {
  FollowingEvent();
}

class GetFollowing extends FollowingEvent {
  final String id;
  GetFollowing({required this.id});

  @override
  List<Object> get props => [id];
}
