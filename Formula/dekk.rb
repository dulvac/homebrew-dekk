class Dekk < Formula
  desc "Present markdown-authored slides with a branded dark cinematic visual identity"
  homepage "https://github.com/dulvac/dekk"
  url "https://github.com/dulvac/dekk/releases/download/v0.1.5/dekk-0.1.5.tar.gz"
  sha256 "683568861df8386379c7749b6f91abfc63161d829015d77feee1bd51ce85b3e9"
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
