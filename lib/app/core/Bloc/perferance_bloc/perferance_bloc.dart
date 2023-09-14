import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import '../../../Models/prefrence_models.dart';
import '../../Services/Database/database_service.dart';
part 'perferance_event.dart';
part 'perferance_state.dart';

/// [PreferenceBloc] handles the business logic related to user preferences.
///
/// It listens to [PreferenceEvent] and produces [PreferenceState].
class PreferenceBloc extends Bloc<PreferenceEvent, PreferenceState> {
  PreferenceBloc() : super(PreferenceInitial()) {
    _initializeEventHandlers();
  }

  /// Initializes event handlers for the bloc.
  void _initializeEventHandlers() {
    _handleGetPrefEvent();
    _handleChangePrefEvent();
  }

  /// Handles the [GetPrefEvent].
  void _handleGetPrefEvent() {
    on<GetPrefEvent>((event, emit) async {
      _logDebug("Processing GetPrefEvent for categoryId: ${event.categoryId}");
      emit(PreferenceLoading());
      try {
        final preference = await getPreference(
            userId: currentUserId!, categoryId: event.categoryId);
        if (preference.isNotEmpty) {
          _logDebug("Emitting GetPrefSucceededState");
          emit(GetPrefSucceededState(prefObj: preference.values.first));
        } else {
          _logDebug("Emitting GetPrefFailedState: No preference found.");
          emit(GetPrefFailedState(error: 'No preference found.'));
        }
      } catch (e) {
        _logError("Error in GetPrefEvent: $e");
        emit(GetPrefFailedState(error: e.toString()));
      }
    });
  }

  /// Handles the [ChangePrefEvent].
  void _handleChangePrefEvent() {
    on<ChangePrefEvent>((event, emit) async {
      _logDebug(
          "Processing ChangePrefEvent for categoryId: ${event.categoryId}");
      try {
        await updatePref(
            userId: event.userId,
            isIncluded: event.isIncluded,
            categoryId: event.categoryId);
        _logDebug("Preference updated successfully.");

        // Fetch the updated preference after updating it
        final preference = await getPreference(
            userId: currentUserId!, categoryId: event.categoryId);
        if (preference.isNotEmpty) {
          _logDebug("Emitting GetPrefSucceededState");
          emit(GetPrefSucceededState(prefObj: preference.values.first));
        } else {
          _logDebug("Emitting GetPrefFailedState: No preference found.");
          emit(GetPrefFailedState(error: 'No preference found.'));
        }
      } catch (e) {
        _logError("Error in ChangePrefEvent: $e");
        emit(GetPrefFailedState(error: e.toString()));
      }
    });
  }

  /// Logs debug messages if [kDebugMode] is enabled.
  void _logDebug(String message) {
    if (kDebugMode) {
      print(message);
    }
  }

  /// Logs error messages if [kDebugMode] is enabled.
  void _logError(String message) {
    if (kDebugMode) {
      print(message);
    }
  }
}
