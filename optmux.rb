class Optmux < Formula
  desc "Optimal, opinionated, batteries-included TMUX — recommended extras"
  homepage "https://pypi.org/project/optmux/"
  url "https://github.com/netj/optmux/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "bb79adca6b1fa5b72fa8aa8ddc65697327b1fddd1011e008e3cd0fbcf9c17805"
  version "0.2.1"
  license "MIT"

  depends_on "uv"
  depends_on "netj/tap/wtcode"
  depends_on "lazygit"

  def install
    # Install a wrapper that delegates to uvx
    (bin/"optmux").write <<~SH
      #!/bin/sh
      exec uvx optmux "$@"
    SH
  end

  test do
    system bin/"optmux", "--help"
  end
end
