import 'package:ensure/features/profile/data/models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ensure/features/profile/domain/use%20case/profile_use_case.dart';
import 'package:logger/logger.dart';
import '../../../posts/data/models/post_model.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileUseCase profileUseCase;
  ProfileCubit(this.profileUseCase) : super(ProfileInitial());

  bool isFollowing = false;

  Future<bool> checkFollowing(String userId, String followingId) async {
    debugPrint("isFollowing before: $isFollowing");
    bool followingStatus =
        await profileUseCase.isFollowing(userId, followingId);
    debugPrint("following Status after: $followingStatus");
    isFollowing = followingStatus;
    debugPrint("isFollowing: $isFollowing");
    return followingStatus;
  }

  Future<ProfileModel> getProfile(String userId) async {
    emit(ProfileLoading());
    try {
      final profile = await profileUseCase.getProfile(userId);
      emit(ProfileSuccess(profile: profile));

      // Fetch posts after successfully getting the profile
      await getPostsByUserId(profile.id);
      return profile;
    } catch (e) {
      emit(ProfileError(e.toString()));
      rethrow;
    }
  }

  Future<void> setFollow(String userId, String followingId) async {
    if (isFollowing) {
      await profileUseCase.setUnfollow(userId, followingId);
    } else {
      await profileUseCase.setFollow(userId, followingId);
    }
    debugPrint("isFollowing: $isFollowing");

    checkFollowing(userId, followingId);
    getProfile(followingId);
  }

  Future<List<PostModel>> getPostsByUserId(String userId) async {
    return await profileUseCase.getPostsByUserId(userId);
  }

  Future<List<ProfileModel>> getFollowers(String userId) async {
    
    try {
      final followers = await profileUseCase.getFollowers(userId);
      Logger().d(followers);
      return followers;
    } catch (e) {
      Logger().e(e);
      rethrow;
    }
  }

  Future<List<ProfileModel>> getFollowing(String userId) async {
    return await profileUseCase.getFollowing(userId);
  }
}
