import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

class MockPathProviderPlatform extends PathProviderPlatform {
  @override
  Future<String> getTemporaryPath() async {
    return '.';
  }

  @override
  Future<String> getApplicationDocumentsPath() async {
    return '.';
  }

  @override
  Future<String> getApplicationSupportPath() async {
    return '.';
  }

  @override
  Future<String> getLibraryPath() async {
    return '.';
  }

  @override
  Future<String> getExternalStoragePath() async {
    return '.';
  }

  @override
  Future<List<String>> getExternalCachePaths() async {
    return ['.'];
  }

  @override
  Future<List<String>?> getExternalStoragePaths(
      {StorageDirectory? type}) async {
    return ['.'];
  }

  @override
  Future<String> getDownloadsPath() async {
    return '.';
  }
}

void setupPathProviderMock() {
  PathProviderPlatform.instance = MockPathProviderPlatform();
}
