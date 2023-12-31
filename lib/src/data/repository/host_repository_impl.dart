import 'dart:ffi';

import 'package:tiktok_tool/src/data/network/dto/room_resp_dto.dart';
import 'package:tiktok_tool/src/data/network/request/host_request.dart';
import 'package:tiktok_tool/src/data/network/request/record_request.dart';
import 'package:tiktok_tool/src/data/network/request/room_request.dart';
import 'package:tiktok_tool/src/data/network/request/user_request.dart';
import 'package:tiktok_tool/src/domain/model/host.dart';
import 'package:tiktok_tool/src/domain/repository/host_repository.dart';
import 'package:tiktok_tool/src/network/http.dart';

import '../../domain/model/comment.dart';
import '../../domain/model/room.dart';
import '../../domain/model/user.dart';
import '../../network/result.dart';
import '../network/dto/comment_resp_dto.dart';
import '../network/dto/host_resp_dto.dart';
import '../network/dto/user_resp_dto.dart';
import '../network/request/comment_request.dart';

class HostRepositoryImpl implements HostRepository {
  final XRestService service;

  HostRepositoryImpl(this.service);

  @override
  Future<XApiSnapshot<Iterable<HostModel>>> getHosts() async {
    final request = GetHostsRequest();
    final snapshot = XApiHandler(restService: service).execute(
      request,
      (arrayJson) => List<HostModel>.from(
        arrayJson.map(
          (json) =>
              HostResponseDTO.fromJson(json as Map<String, dynamic>).toModel(),
        ),
      ),
    );
    return snapshot;
  }

  @override
  Future<XApiSnapshot<HostModel>> getHostDetail(String hostId) {
    final request = GetHostDetailRequest(hostId: hostId);
    final snapshot = XApiHandler(restService: service).execute(
      request,
      (json) => HostResponseDTO.fromJson(json).toModel(),
    );
    return snapshot;
  }

  @override
  Future<XApiSnapshot<Iterable<RoomModel>>> getRooms(String hostId) {
    final request = GetRoomsRequest(hostId: hostId);
    final snapshot = XApiHandler(restService: service).execute(
      request,
      (arrayJson) => List<RoomModel>.from(
        arrayJson.map(
          (json) =>
              RoomResponseDTO.fromJson(json as Map<String, dynamic>).toModel(),
        ),
      ),
    );
    return snapshot;
  }

  @override
  Future<XApiSnapshot<RoomModel>> getRoomDetail(String roomId) {
    final request = GetRoomDetailRequest(roomId: roomId);
    final snapshot = XApiHandler(restService: service).execute(
      request,
      (json) =>
          RoomResponseDTO.fromJson(json as Map<String, dynamic>).toModel(),
    );
    return snapshot;
  }

  @override
  Future<XApiSnapshot<Iterable<CommentModel>>> getCommentsByHost(
    String hostId,
    String? uniqueId,
  ) {
    final request =
        GetCommentsByHostRequest(hostId: hostId, uniqueId: uniqueId);
    final snapshot = XApiHandler(restService: service).execute(
      request,
      (arrayJson) => List<CommentModel>.from(
        arrayJson.map(
          (json) => CommentResponseDTO.fromJson(json as Map<String, dynamic>)
              .toModel(),
        ),
      ),
    );
    return snapshot;
  }

  @override
  Future<XApiSnapshot<Iterable<CommentModel>>> getCommentsByRoom(
    String roomId,
    String? uniqueId,
  ) {
    final request =
        GetCommentsByRoomRequest(roomId: roomId, uniqueId: uniqueId);
    final snapshot = XApiHandler(restService: service).execute(
      request,
      (arrayJson) => List<CommentModel>.from(
        arrayJson.map(
          (json) => CommentResponseDTO.fromJson(json as Map<String, dynamic>)
              .toModel(),
        ),
      ),
    );
    return snapshot;
  }

  @override
  Future<XApiSnapshot<Iterable<UserModel>>> getPotentialUsersByHost(
      String hostId) {
    final request = GetPotentialUsersByHostRequest(hostId: hostId);
    final snapshot = XApiHandler(restService: service).execute(
      request,
      (arrayJson) => List<UserModel>.from(
        arrayJson.map(
          (json) =>
              UserResponseDTO.fromJson(json as Map<String, dynamic>).toModel(),
        ),
      ),
    );
    return snapshot;
  }

  @override
  Future<XApiSnapshot<Iterable<UserModel>>> getPotentialUsersByRoom(
      String roomId) {
    final request = GetPotentialUsersByRoomRequest(roomId: roomId);
    final snapshot = XApiHandler(restService: service).execute(
      request,
      (arrayJson) => List<UserModel>.from(
        arrayJson.map(
          (json) =>
              UserResponseDTO.fromJson(json as Map<String, dynamic>).toModel(),
        ),
      ),
    );
    return snapshot;
  }

  @override
  Future<XApiSnapshot<UserModel>> getUserProfile(String uniqueId) {
    final request = GetUserProfileRequest(uniqueId: uniqueId);
    final snapshot = XApiHandler(restService: service).execute(
        request,
        (json) =>
            UserResponseDTO.fromJson(json as Map<String, dynamic>).toModel());
    return snapshot;
  }

  @override
  Future<XApiSnapshot<Bool>> isRecording(String hostId) {
    final request = CheckRecordingRequest(hostId: hostId);
    final snapshot = XApiHandler(restService: service)
        .execute(request, (result) => result as Bool);
    return snapshot;
  }

  @override
  Future<XApiSnapshot<Bool>> startRecord(String hostId) {
    final request = StartRecordRequest(hostId: hostId);
    final snapshot = XApiHandler(restService: service)
        .execute(request, (result) => result as Bool);
    return snapshot;
  }

  @override
  Future<XApiSnapshot<Bool>> stopRecord(String hostId) {
    final request = StopRecordRequest(hostId: hostId);
    final snapshot = XApiHandler(restService: service)
        .execute(request, (result) => result as Bool);
    return snapshot;
  }
}
