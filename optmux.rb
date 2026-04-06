class Optmux < Formula
  desc "Optimal, opinionated, batteries-included TMUX — recommended extras"
  homepage "https://pypi.org/project/optmux/"
  url "https://github.com/netj/optmux/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "468ef7d25fd9b2a36df7d182691acedd5d8bcab33b5083a5d249eb3fe57c1337"
  version "0.1.2"
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
