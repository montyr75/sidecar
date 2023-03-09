import 'package:appwrite/appwrite.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'appwrite.g.dart';

const projectID = '640509d1427ecb8ca360';
const endpoint = 'https://137.184.84.239/v1';
const dbID = '64050affc996c7c754bf';

@riverpod
Client appwriteClient(AppwriteClientRef ref) {
  final client = Client();
  return client
      .setEndpoint(endpoint)
      .setProject(projectID)
      .setSelfSigned(status: true); // For self signed certificates, only use for development
}

@riverpod
Account appwriteAccountService(AppwriteAccountServiceRef ref) {
  return Account(ref.watch(appwriteClientProvider));
}

@riverpod
Databases appWriteDb(AppWriteDbRef ref) {
  return Databases(ref.watch(appwriteClientProvider));
}