import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment.freezed.dart';

@freezed
class CommentModel with _$CommentModel {
  const factory CommentModel({
    required String id,
    required String userId,
    required String uniqueId,
    required String nickname,
    required String avatar,
    required String comment,
    required int createTime,
  }) = _CommentModel;
}
