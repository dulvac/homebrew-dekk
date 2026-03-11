class Dekk < Formula
  desc "Present markdown-authored slides with a branded dark cinematic visual identity"
  homepage "https://github.com/dulvac/dekk"
  url "https://github.com/dulvac/dekk/releases/download/v0.1.2/dekk-0.1.2.tar.gz"
  sha256 "73281ed089323d7d88cd63fd96b5dbe31100cd00abb47e67df800cc5bae61c48"
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
