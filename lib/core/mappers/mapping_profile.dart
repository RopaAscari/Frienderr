import 'package:automap/automap.dart';
import 'package:frienderr/features/data/models/chat/chat_model.dart';
import 'package:frienderr/features/data/models/chat/latest_message.dart';
import 'package:frienderr/features/data/models/notification/notification_metadata.dart';
import 'package:frienderr/features/data/models/notification/notification_model.dart';
import 'package:frienderr/features/data/models/notification/partial_post.dart';

import 'package:frienderr/features/data/models/snap/snap_model.dart';
import 'package:frienderr/features/domain/entities/chat.dart';
import 'package:frienderr/features/domain/entities/notification.dart';
import 'package:frienderr/features/domain/entities/post.dart';
import 'package:frienderr/features/domain/entities/quick.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:frienderr/features/domain/entities/story.dart';
import 'package:frienderr/features/domain/entities/comment.dart';
import 'package:frienderr/features/data/models/post/post_model.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/data/models/story/story_media.dart';
import 'package:frienderr/features/data/models/story/story_model.dart';
import 'package:frienderr/features/data/models/post/content_model.dart';
import 'package:frienderr/features/data/models/story/story_content.dart';
import 'package:frienderr/features/data/models/post/metadata_model.dart';
import 'package:frienderr/features/data/models/story/story_metadata.dart';
import 'package:frienderr/features/data/models/comment/comment_model.dart';
import 'package:frienderr/features/data/models/post/post_reaction_model.dart';

class MappingProfile {
  MappingProfile() {
    AutoMapper.I.addManualMap<UserDTO, UserModel>((source, mapper, params) =>
        UserModel(
            id: source.id,
            username: source.username ?? '',
            profilePic: source.profilePic));

    AutoMapper.I.addManualMap<PostMetadataDTO, PostMetadata>(
        (source, mapper, params) => PostMetadata(
              thumbnail: source.thumbnail,
            ));

    AutoMapper.I.addManualMap<List<ContentDTO>, List<Content>>(
        (sources, mapper, params) => sources
            .map((source) => Content(
                  type: source.type,
                  media: source.media,
                  metadata: AutoMapper.I.map<PostMetadataDTO, PostMetadata>(
                    source.metadata,
                  ),
                ))
            .toList());

    AutoMapper.I.addManualMap<List<PostReactionDTO>, List<PostReaction>>(
        (sources, mapper, params) => sources
            .map((source) => PostReaction(
                  uid: source.uid,
                  postId: source.postId,
                  reaction: source.reaction,
                ))
            .toList());

    AutoMapper.I.addManualMap<PostReactionDTO?, PostReaction>(
        (source, mapper, params) => PostReaction(
              uid: source?.uid,
              postId: source?.postId,
              reaction: source?.reaction,
            ));

    AutoMapper.I.addManualMap<PostDTO, Post>((source, mapper, params) => Post(
          id: source.id,
          type: source.type,
          saves: source.saves,
          shares: source.shares,
          isSaved: source.isSaved,
          caption: source.caption,
          comments: source.comments,
          reactions: source.reactions,
          userReaction: AutoMapper.I.map<PostReactionDTO?, PostReaction>(
            source.userReaction,
          ),
          dateCreated: source.dateCreated,
          content: AutoMapper.I.map<List<ContentDTO>, List<Content>>(
            source.content,
          ),
          user: AutoMapper.I.map<UserDTO, UserModel>(
            source.user,
          ),
          latestReactions:
              AutoMapper.I.map<List<PostReactionDTO>, List<PostReaction>>(
            source.latestReactions,
          ),
        ));

    AutoMapper.I.addManualMap<List<PostDTO>, List<Post>>(
        (sources, mapper, params) => sources
            .map((source) => Post(
                  id: source.id,
                  type: source.type,
                  saves: source.saves,
                  shares: source.shares,
                  isSaved: source.isSaved,
                  caption: source.caption,
                  comments: source.comments,
                  reactions: source.reactions,
                  userReaction:
                      AutoMapper.I.map<PostReactionDTO?, PostReaction>(
                    source.userReaction,
                  ),
                  dateCreated: source.dateCreated,
                  content: AutoMapper.I.map<List<ContentDTO>, List<Content>>(
                    source.content,
                  ),
                  user: AutoMapper.I.map<UserDTO, UserModel>(
                    source.user,
                  ),
                  latestReactions: AutoMapper.I
                      .map<List<PostReactionDTO>, List<PostReaction>>(
                    source.latestReactions,
                  ),
                ))
            .toList());

    AutoMapper.I
        .addManualMap<StoryDTO, Story>((source, mapper, params) => Story(
              id: source.id,
              dateUpdated: source.dateUpdated,
              isPersitent: source.isPersitent,
              content:
                  AutoMapper.I.map<List<StoryContentDTO>, List<StoryContent>>(
                source.content,
              ),
              user: AutoMapper.I.map<UserDTO, UserModel>(
                source.user,
              ),
            ));

    AutoMapper.I.addManualMap<List<StoryDTO>, List<Story>>(
        (sources, mapper, params) => sources
            .map((source) => Story(
                  id: source.id,
                  dateUpdated: source.dateUpdated,
                  isPersitent: source.isPersitent,
                  content: AutoMapper.I
                      .map<List<StoryContentDTO>, List<StoryContent>>(
                    source.content,
                  ),
                  user: AutoMapper.I.map<UserDTO, UserModel>(
                    source.user,
                  ),
                ))
            .toList());

    AutoMapper.I.addManualMap<List<StoryContentDTO>, List<StoryContent>>(
        (sources, mapper, params) => sources
            .map((source) => StoryContent(
                  id: source.id,
                  views: source.views,
                  reactions: source.reactions,
                  dateCreated: source.reactions,
                  isViewed: source.isViewed ?? false,
                  media: AutoMapper.I.map<StoryMediaDTO, StoryMedia>(
                    source.media,
                  ),
                ))
            .toList());

    AutoMapper.I.addManualMap<StoryMediaDTO, StoryMedia>(
        (source, mapper, params) => StoryMedia(
              url: source.url,
              type: source.type,
              metadata: AutoMapper.I.map<StoryMetadataDTO, StoryMetadata>(
                source.metadata,
              ),
            ));

    AutoMapper.I.addManualMap<StoryMetadataDTO, StoryMetadata>(
        (source, mapper, params) => StoryMetadata(
              thumbnail: source.thumbnail,
            ));

    AutoMapper.I.addManualMap<List<StoryContent>, List<StoryContentDTO>>(
        (sources, mapper, params) => sources
            .map((source) => StoryContentDTO(
                  id: source.id,
                  views: source.views,
                  isViewed: source.isViewed,
                  reactions: source.reactions,
                  dateCreated: source.reactions,
                  media: AutoMapper.I.map<StoryMedia, StoryMediaDTO>(
                    source.media,
                  ),
                ))
            .toList());

    AutoMapper.I.addManualMap<StoryMedia, StoryMediaDTO>(
        (source, mapper, params) => StoryMediaDTO(
              url: source.url,
              type: source.type,
              metadata: AutoMapper.I.map<StoryMetadata, StoryMetadataDTO>(
                source.metadata,
              ),
            ));

    AutoMapper.I.addManualMap<StoryMetadata, StoryMetadataDTO>(
        (source, mapper, params) => StoryMetadataDTO(
              thumbnail: source.thumbnail,
            ));

    AutoMapper.I.addManualMap<List<CommentDTO>, List<Comment>>(
        (sources, mapper, params) => sources
            .map((source) => Comment(
                  id: source.id,
                  comment: source.comment,
                  dateCreated: source.dateCreated,
                  likes: source.likes.cast<String>(),
                  user: AutoMapper.I.map<UserDTO, UserModel>(
                    source.user,
                  ),
                ))
            .toList());

    AutoMapper.I
        .addManualMap<CommentDTO, Comment>((source, mapper, params) => Comment(
              id: source.id,
              comment: source.comment,
              dateCreated: source.dateCreated,
              likes: source.likes.cast<String>(),
              user: AutoMapper.I.map<UserDTO, UserModel>(
                source.user,
              ),
            ));

    AutoMapper.I.addManualMap<List<NotificationDTO>, List<NotificationModel>>(
      (sources, mapper, params) => sources
          .map((source) => NotificationModel(
              id: source.id,
              type: source.type,
              mediaType: source.mediaType,
              dateCreated: source.dateCreated,
              recipientId: source.recipientId,
              post: AutoMapper.I.map<PartialPostDTO, PartialPost>(
                source.post,
              ),
              metadata: AutoMapper.I
                  .map<NotificationMetadataDTO, NotificationMetadata>(
                source.metadata,
              ),
              user: AutoMapper.I.map<UserDTO, UserModel>(
                source.user,
              )))
          .toList(),
    );

    AutoMapper.I.addManualMap<PartialPostDTO, PartialPost>(
        (source, mapper, params) => PartialPost(
              id: source.id,
              display: source.display,
            ));

    AutoMapper.I.addManualMap<NotificationMetadataDTO, NotificationMetadata>(
        (source, mapper, params) => NotificationMetadata(
              comment: source.comment,
            ));

    AutoMapper.I.addManualMap<List<ChatDTO>, List<ChatModel>>(
        (sources, mapper, params) => sources
            .map((source) => ChatModel(
                  id: source.id,
                  unread: source.unread ?? {},
                  dateUpdated: source.dateUpdated,
                  typing: source.typing.cast<String>(),
                  participants: source.participants,
                  latestMessage:
                      AutoMapper.I.map<LatestMessageDTO, LatestMessage>(
                    source.latestMessage as LatestMessageDTO,
                  ),
                ))
            .toList());

    AutoMapper.I.addManualMap<LatestMessageDTO, LatestMessage>(
        (source, mapper, params) => LatestMessage(
              date: source.date,
              message: source.message,
            ));

    AutoMapper.I.addManualMap<List<SnapDTO>, List<Snap>>(
        (sources, mapper, params) => sources
            .map((source) => Snap(
                  id: source.id,
                  url: source.url,
                  audio: source.audio,
                  user: AutoMapper.I.map<UserDTO, UserModel>(
                    source.user,
                  ),
                  likes: source.likes,
                  saves: source.saves,
                  shares: source.shares,
                  caption: source.caption,
                  comments: source.comments,
                  thumbnail: source.thumbnail,
                  dateCreated: source.dateCreated,
                  isLiked: source.isLiked ?? false,
                ))
            .toList());

    AutoMapper.I.addManualMap<List<UserDTO>, List<UserModel>>(
        (sources, mapper, params) => sources
            .map((source) => UserModel(
                id: source.id,
                username: source.username ?? '',
                profilePic: source.profilePic))
            .toList());
  }
}
