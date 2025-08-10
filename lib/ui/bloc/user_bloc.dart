import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:case_study_movies_project/ui/bloc/user_event.dart';
import 'package:case_study_movies_project/ui/bloc/user_state.dart';
import 'package:case_study_movies_project/services/abstract_classes/i_logger_service.dart';
import 'package:case_study_movies_project/services/abstract_classes/i_user_service.dart';
import 'package:case_study_movies_project/services/global_services.dart/dependency_injection_service.dart';
import 'package:case_study_movies_project/services/image_handler_service.dart';
import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final IUserService userService;
  final _imageHandlerService = locator<ImageHandlerService>();
  final _logger = locator<ILoggerService>();

  UserBloc({required this.userService}) : super(UserState.initial) {
    on<GetUserProfileEvent>(_onGetUserProfileEvent);
    on<UploadUserPhotoEvent>(_onUploadUserPhotoEvent);
    on<ShowPhotoWarningMessageEvent>(_onShowPhotoWarningMessageEvent);
  }

  Future<void> _onGetUserProfileEvent(
      GetUserProfileEvent event, Emitter<UserState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    _logger.logInfo('Loading user profile');

    try {
      final user = await userService.getProfile();

      emit(state.copyWith(user: user, isLoading: false));
      _logger.logInfo('User profile loaded');
    } catch (e, stack) {
      _logger.logError('Failed to load profile',
          error: e is Exception ? e : Exception(e.toString()), stack: stack);
      emit(state.copyWith(errorMessage: e.toString(), isLoading: false));
    }
  }

  Future<void> _onUploadUserPhotoEvent(
      UploadUserPhotoEvent event, Emitter<UserState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    _logger.logInfo('Photo upload started');

    try {
      final photoPath = await _imageHandlerService.pickImageFromGallery();
      if (photoPath == null) {
        emit(state.copyWith(
            isLoading: false, errorMessage: AppStrings.errors.photoPickFail));
        _logger.logWarning('Photo pick canceled');
        return;
      }

      emit(state.copyWith(selectedPhotoPath: photoPath));
      _logger.logInfo('Photo compressing');

      final compressedFile =
          await _imageHandlerService.resizeAndCompressImage(photoPath);

      final photoUrl = await userService.uploadPhoto(compressedFile.path);

      if (state.user != null) {
        final updatedUser = state.user!.copyWith(photoUrl: photoUrl);

        emit(state.copyWith(
          user: updatedUser,
          isLoading: false,
          errorMessage: AppStrings.errors.photoUploadSuccess,
          selectedPhotoPath: photoPath,
        ));
        _logger.logInfo('User profile photo updated in state');
      } else {
        _logger.logWarning('User profile not loaded, photo update failed');
        emit(state.copyWith(
            isLoading: false,
            errorMessage: 'User profile not loaded, photo update failed'));
      }
    } catch (e, stack) {
      _logger.logError('Photo upload failed',
          error: e is Exception ? e : Exception(e.toString()), stack: stack);
      emit(state.copyWith(
          isLoading: false,
          errorMessage: '${AppStrings.errors.photoPickFail} ${e.toString()}'));
    }
  }

  Future<void> _onShowPhotoWarningMessageEvent(
      ShowPhotoWarningMessageEvent event, Emitter<UserState> emit) async {
    emit(state.copyWith(errorMessage: AppStrings.errors.photoUploadWarning));
  }
}
