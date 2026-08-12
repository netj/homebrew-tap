class Optmux < Formula
  desc "Optimal, opinionated, batteries-included TMUX — recommended extras"
  homepage "https://pypi.org/project/optmux/"
  url "https://github.com/netj/optmux/archive/refs/tags/v0.9.0.tar.gz"
  sha256 "c85f203e0609681e104fc11ed9d12d9969ff7cf28a9350d2bfc227108633f2ff"
  version "0.9.0"
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
