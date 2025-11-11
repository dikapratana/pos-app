bool isEmpty(dynamic value) {
  if (value == null) return true; // null = kosong

  if (value is String) {
    return value.trim().isEmpty; // string kosong atau cuma spasi
  }

  if (value is Iterable || value is Map) {
    return value.isEmpty; // list, set, map kosong
  }

  return false; // selain itu dianggap tidak kosong
}
