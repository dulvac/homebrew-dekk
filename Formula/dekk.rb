class Dekk < Formula
  desc "Present markdown-authored slides with a branded dark cinematic visual identity"
  homepage "https://github.com/dulvac/dekk"
  url "https://github.com/dulvac/dekk/releases/download/v0.1.0/dekk-0.1.0.tar.gz"
  sha256 "91624e4d767ce6b0b7981625bcd212296bea54c95ca5fcf5215872cb6e70ddde"
  license "MIT"

  depends_on "node@22"

  def install
    libexec.install "bin/dekk.js"
    libexec.install "dist"
    libexec.install "package.json"

    (bin/"dekk").write <<~EOS
      #!/bin/bash
      exec "#{Formula["node@22"].opt_bin}/node" "#{libexec}/bin/dekk.js" "$@"
    EOS
  end

  test do
    assert_match "dekk", shell_output("#{bin}/dekk --version")
  end
end
