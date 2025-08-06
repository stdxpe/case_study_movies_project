import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:case_study_movies_project/services/abstract_classes/i_user_service.dart';
import 'package:case_study_movies_project/ui/bloc/user_event.dart';
import 'package:case_study_movies_project/ui/bloc/user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final IUserService userService;

  UserBloc({required this.userService}) : super(UserInitial()) {
    on<GetUserProfileEvent>(_onGetUserProfileEvent);
    on<UploadUserPhotoEvent>(_onUploadUserPhotoEvent);
  }

  Future<void> _onGetUserProfileEvent(
      GetUserProfileEvent event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      final user = await userService.getProfile();
      emit(UserLoaded(userEntity: user));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> _onUploadUserPhotoEvent(
    UploadUserPhotoEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(UserLoading());
    try {
      final photoUrl = await userService.uploadPhoto(event.filePath);
      emit(UserPhotoUploaded(photoUrl));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }
}
