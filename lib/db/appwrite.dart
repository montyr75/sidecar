import 'package:appwrite/appwrite.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'appwrite.g.dart';

const projectID = '6402cba725d77ce1e716';
const dbID = '6402d1866b4425840e54';
const endpoint = 'http://localhost/v1';


@riverpod
Client appwriteClient(AppwriteClientRef ref) {
  final client = Client();
  return client
      .setEndpoint(endpoint)
      .setProject(projectID)
      .setSelfSigned(status: true); // For self signed certificates, only use for development
}
