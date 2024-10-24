import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ensure/features/profile/domain/use%20case/profile_use_case.dart';
import '../../../posts/data/models/post_model.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileUseCase profileUseCase;
  ProfileCubit(this.profileUseCase) : super(ProfileInitial());

  List<PostModel> posts = [];

  Future<void> getProfile(String userId) async {
    emit(ProfileLoading());
    try {
      final profile = await profileUseCase.getProfile(userId);
      emit(ProfileSuccess(profile: profile));
      
      // Fetch posts after successfully getting the profile
      await getPostsByUserId(profile.id);
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<List<PostModel>> getPostsByUserId(String userId) async {
   return await profileUseCase.getPostsByUserId(userId);
  }
}
