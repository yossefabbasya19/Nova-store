import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/main_layout/profile_tab/data/model/UpdateUserInfoRequest.dart';
import 'package:ecommerce_app/features/main_layout/profile_tab/data/repo/profile_repo.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepo) : super(ProfileInitial());
  final ProfileRepo profileRepo;

  updateUserData(Map<String,dynamic> data) async {
    emit(NameUpdateLoading());
    var result = await profileRepo.updateUserProfileData(data);
    result.fold(
      (l) {
        if(data['email']!=null) {
          emit(EmailUpdateFailure(errorMessage: l.errorMessage));
        }
        if(data['name']!=null) {
          emit(NameUpdateFailure(errorMessage: l.errorMessage));
        }
      },
      (r) {
        if(data['email']!=null) {
          emit(EmailUpdateSuccess());
        }
        if(data['name']!=null) {
          emit(NameUpdateSuccess());
        }
      },
    );
  }
}
