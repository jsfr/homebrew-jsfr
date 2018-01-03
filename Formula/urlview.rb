class Urlview < Formula
  desc "URL extractor/launcher"
  homepage "https://github.com/sigpipe/urlview"
  url "https://github.com/sigpipe/urlview/archive/08767aa863cd27d1755ba0aff65b8cc1a0c1446a.tar.gz"
  sha256 "23d32e7f610601f012e06d79b206d4952259bdabe9aa64940c7e1bb8c0cb6519"
  version "0.9-21"
  head "https://github.com/sigpipe/urlview.git"

  def install
    inreplace "urlview.man", "/etc/urlview/url_handler.sh", "open"
    inreplace "urlview.c",
      '#define DEFAULT_COMMAND "/etc/urlview/url_handler.sh %s"',
      '#define DEFAULT_COMMAND "open %s"'

    man1.mkpath
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}",
                          "--sysconfdir=#{etc}"
    system "make", "install"
  end
end
