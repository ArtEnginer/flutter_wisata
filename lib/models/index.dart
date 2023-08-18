export 'auth_model.dart';
export 'hotel_model.dart';
export 'infografis_model.dart';
export 'user_model.dart';
export 'wisata_model.dart';
import 'package:quiver/core.dart';

T? checkOptional<T>(Optional<T?>? optional, T? Function()? def) {
  // No value given, just take default value
  if (optional == null) return def?.call();

  // We have an input value
  if (optional.isPresent) return optional.value;

  // We have a null inside the optional
  return null;
}
