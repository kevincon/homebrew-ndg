class UncrustifyAT059 < Formula
  desc "Source code beautifier for C, C++, C#, ObjectiveC, D, Java, Pawn, and VALA"
  homepage "https://github.com/uncrustify/uncrustify"
  url "https://github.com/uncrustify/uncrustify/archive/uncrustify-0.59.tar.gz"
  sha256 "0eb664437e38ed0fa28441bc809a8baabf5bd9e8239d52a2ea32f6248407c3b4"

  def install
    # This patch makes 0.59 build on macOS >= Sierra.
    inreplace "src/uncrustify.cpp",
              "#include <deque>",
              "#include <deque>\n#include <unistd.h>"

    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    system "#{bin}/uncrustify", "--version"
  end
end
