import mkdio

public enum MarkdownError: Error {
  case conversionFailed
}

public func markdownToHTML(_ str: String) throws -> String {
  var buffer: UnsafeMutablePointer<Int8>?
  try str.withCString {
    // Maybe have an option to use gfm_string?
    guard let doc = mkdio.mkd_string($0, Int32(strlen($0)), mkd_flag_t(MKD_EXTRA_FOOTNOTE)) else {
      throw MarkdownError.conversionFailed
    }
    guard mkdio.mkd_compile(doc, mkd_flag_t(MKD_EXTRA_FOOTNOTE)) == 1 else {
      throw MarkdownError.conversionFailed
    }
    mkdio.mkd_document(doc, &buffer)
    free(doc)
  }
  let html = String(cString: buffer!)
  free(buffer)
  return html
}
