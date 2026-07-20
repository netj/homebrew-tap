class Optmux < Formula
  desc "Optimal, opinionated, batteries-included TMUX — recommended extras"
  homepage "https://pypi.org/project/optmux/"
  url "https://github.com/netj/optmux/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "73ffe8e34bebfccaa6cd7bbdb070120822a7d02814092a92b393c4dd74835497"
  version "0.6.0"
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
