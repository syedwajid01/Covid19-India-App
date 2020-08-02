import 'package:permission_handler/permission_handler.dart';

class PermissionHandler
{

  Future<bool> askPermission() async
  {
    var status = await Permission.storage.status;
    if (status.isUndetermined || status.isDenied) {
      // We didn't ask for permission yet.
      PermissionStatus storagestatus = await Permission.storage.request();
      if(storagestatus == PermissionStatus.denied || storagestatus == PermissionStatus.permanentlyDenied)
      {
        return false;
      }
      return true;
    }
    return false;
  }
}