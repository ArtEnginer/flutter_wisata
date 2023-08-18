class BaseApi {
  String _getApiHost() {
    return 'https://wisata.anggaegae.my.id/';
  }

  String _getAuthHost() {
    return _getApiHost();
  }

  String getRestUrl() {
    return '${_getApiHost()}api/';
  }

  String getApiUrl() {
    return '${_getApiHost()}api/v2/';
  }

  String getAuthUrl() {
    return '${_getAuthHost()}jwt/';
  }

  String getFileUrl(String? category) {
    return '${_getAuthHost()}store/${category != null ? '$category/' : ""}';
  }
}
