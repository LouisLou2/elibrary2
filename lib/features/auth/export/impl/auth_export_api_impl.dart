import 'package:elibapp/features/auth/repo/user_state_repo.dart';
import 'package:get_it/get_it.dart';

import '../../bloc/auth_bloc.dart';
import '../../bloc/auth_event.dart';
import '../auth_export_api.dart';

class AuthExportApiImpl implements AuthExportApi {

  @override
  Future<bool> retrieveSetAtAndReactToResult() async {
    bool result = await GetIt.I<UserStateRepo>().retrieveAndSetAt();
    if (!result) {
      GetIt.I<AuthBloc>().add(AuthEvent.logout);
    }
    return result;
  }

  @override
  String getCurrentUserAt() {
    return GetIt.I<UserStateRepo>().getUserAt();
  }

  @override
  int getCurrentUserId() {
    return GetIt.I<UserStateRepo>().userId;
  }

}