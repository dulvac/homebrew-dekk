class Dekk < Formula
  desc "Present markdown-authored slides with a branded dark cinematic visual identity"
  homepage "https://github.com/dulvac/dekk"
  url "https://github.com/dulvac/dekk/releases/download/v0.1.7/dekk-0.1.7.tar.gz"
  sha256 "824c5c078bb7b6c8046af89b094e28927afcb18c88d1d492c5e4c67100859f2a"
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
