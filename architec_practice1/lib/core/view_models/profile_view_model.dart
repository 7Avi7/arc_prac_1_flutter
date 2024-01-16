import 'package:architec_practice1/core/enums/view_state.dart';
import 'package:architec_practice1/core/models/profile_model.dart';
import 'package:architec_practice1/core/services/profile_api.dart';
import 'package:architec_practice1/core/view_models/base_view_model.dart';
import 'package:architec_practice1/locator.dart';

class ProfileViewModel extends BaseViewModel {
  final ProfileAPI _profileAPI = locator<ProfileAPI>();

  List<ProfileModel> profile = [];

  Future<void> getProfile() async {
    setViewState(ViewState.busy);

    profile = await _profileAPI.getProfileAPI();

    setViewState(ViewState.idle);
  }
}
