import 'package:bloc/bloc.dart';
import 'package:einayaaminah/app/core/Services/Database/database_service.dart';
import 'package:einayaaminah/app/core/utilities/Shared/shared_pref/shared_data.dart';
import 'package:flutter/foundation.dart';
import 'package:universal_platform/universal_platform.dart';
import '../../../core/Services/Authentication/authentication_service.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationService _authService = AuthenticationService();

  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<SignInWithGoogleRequested>((event, emit) async {
      if (kDebugMode) {
        print('SignInWithGoogleRequested event triggered');
      }

      emit(AuthenticationInProgress());

      if (UniversalPlatform.isAndroid || UniversalPlatform.isWeb) {
        // Bypass Google Auth and directly create a default user in Supabase
        await _createDefaultUserInSupabase();
        CasheData.setData(key: 'isLoggedIn', value: true);
        emit(AuthenticationSuccess());
      } else {
        try {
          await _authService.signInWithGoogle();
          if (kDebugMode) {
            print('signInWithGoogle method called');
            CasheData.setData(key: 'isLoggedIn', value: true);
          }
          emit(AuthenticationSuccess());
        } catch (error, stacktrace) {
          if (kDebugMode) {
            print('Error during signInWithGoogle: $error');
            print('Stacktrace: $stacktrace');
          }
          emit(AuthenticationFailed(error.toString()));
        }
      }
    });
  }
  Future<void> _createDefaultUserInSupabase() async {
    // Define default email and password
    const defaultEmail = 'defaultuser@example.com';
    const defaultPassword = 'DefaultPassword123!';

    await supabase.auth.signUp(email: defaultEmail, password: defaultPassword);

    // Fetch the current user's ID
    String? userId = supabase.auth.currentUser?.id;

    if (userId != null) {
      // Call the insertToPreferance function to create preference rows for the new user
      try {
        await insertToPreferance(userId: userId);
        if (kDebugMode) {
          print('Preferences created successfully for user: $userId');
        }
      } catch (error) {
        if (kDebugMode) {
          print('Error while creating preferences: $error');
        }
      }
    } else {
      if (kDebugMode) {
        print('Error: User ID not found after signup.');
      }
    }
  }
}
