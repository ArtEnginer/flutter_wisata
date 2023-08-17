class BaseApi {
  String _getApiHost() {
    return 'http://api.wisata/';
  }

  String _getAuthHost() {
    return _getApiHost();
  }

  String getRestUrl() {
    return '${_getApiHost()}api/wisata/';
  }

  String getApiUrl() {
    return '${_getApiHost()}api/wisata/v2/';
  }

  String getAuthUrl() {
    return '${_getAuthHost()}jwt/';
  }

  String getFileUrl() {
    return '${_getAuthHost()}files/image/guci/';
  }
}
