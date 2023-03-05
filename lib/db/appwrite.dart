import 'package:appwrite/appwrite.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'appwrite.g.dart';

const projectID = '6402cba725d77ce1e716';
const endpoint = 'http://10.0.0.228/v1';
const dbID = '6402d1866b4425840e54';

@riverpod
Client appwriteClient(AppwriteClientRef ref) {
  final client = Client();
  return client
      .setEndpoint(endpoint)
      .setProject(projectID)
      .setSelfSigned(status: true); // For self signed certificates, only use for development
}

@riverpod
Databases appWriteDb(AppWriteDbRef ref) {
  return Databases(ref.watch(appwriteClientProvider));
}