class Optmux < Formula
  desc "Optimal, opinionated, batteries-included TMUX — recommended extras"
  homepage "https://pypi.org/project/optmux/"
  url "https://github.com/netj/optmux/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "73ed4154789235635fbb85e5c7278b4be18308e3fcecbc16dde5a943889139ee"
  version "0.5.0"
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
