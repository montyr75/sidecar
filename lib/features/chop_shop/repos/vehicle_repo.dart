import 'dart:convert';

import 'package:appwrite/appwrite.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../db/appwrite.dart';
import '../../../db/models/saved_builds.dart';
import '../../../services/error/error_service.dart';
import '../../auth/services/auth_service.dart';

part 'vehicle_repo.g.dart';

const savedBuildsCollectionID = '64050cb357bad2510213';

@riverpod
VehicleRepo vehicleRepo(VehicleRepoRef ref) {
  return VehicleRepo(
    ref: ref,
    db: ref.watch(appWriteDbProvider),
  );
}

class VehicleRepo {
  final VehicleRepoRef ref;
  final Databases _db;

  const VehicleRepo({
    required this.ref,
    required Databases db,
  }) : _db = db;

  Future<void> createSavedBuilds() async {
    try {
      await _db.createDocument(
        databaseId: dbID,
        collectionId: savedBuildsCollectionID,
        documentId: ref.read(authServiceProvider).uid,
        data: const SavedBuilds().toJson(),
      );
    } catch (e, st) {
      _handleError(e, st);
    }
  }

  Future<SavedBuilds?> getSavedBuilds() async {
    try {
      final doc = await _db.getDocument(
        databaseId: dbID,
        collectionId: savedBuildsCollectionID,
        documentId: ref.read(authServiceProvider).uid,
      );

      // doc.data['vehicles'] = (doc.data['vehicles'] as List<String>).map((value) => jsonDecode(value)).toList();

      return SavedBuilds.fromJson(doc.data);
    } on AppwriteException catch (e, st) {
      if (e.type == "document_not_found") {
        return const SavedBuilds();
      }

      _handleError(e, st);
      return null;
    } catch (e, st) {
      _handleError(e, st);
      return null;
    }
  }

  Future<void> saveSavedBuilds(SavedBuilds data) async {
    try {
      await _db.updateDocument(
        databaseId: dbID,
        collectionId: savedBuildsCollectionID,
        documentId: ref.read(authServiceProvider).uid,
        data: data.toJson(),
      );
    } catch (e, st) {
      _handleError(e, st);
    }
  }

  void _handleError(Object e, StackTrace st) {
    final errorService = ref.read(errorServiceProvider.notifier);

    errorService.onError(
      provider: vehicleRepoProvider,
      error: AppError(
        error: e,
        showAlert: true,
      ),
      st: st,
    );
  }
}
