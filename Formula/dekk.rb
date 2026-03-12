class Dekk < Formula
  desc "Present markdown-authored slides with a branded dark cinematic visual identity"
  homepage "https://github.com/dulvac/dekk"
  url "https://github.com/dulvac/dekk/releases/download/v0.1.3/dekk-0.1.3.tar.gz"
  sha256 "ae3f714016d3cea9e3afb5432f0ecebd93c8bf096a4221ebfe2aa24b5d8512d7"
  license "MIT"

  depends_on "node@22"

  def install
    libexec.install "dekk.js"
    libexec.install "dist"
    libexec.install "package.json"

    (bin/"dekk").write <<~EOS
      #!/bin/bash
      exec "#{Formula["node@22"].opt_bin}/node" "#{libexec}/dekk.js" "$@"
    EOS
  end

  test do
    assert_match "dekk", shell_output("#{bin}/dekk --version")
  end
end
