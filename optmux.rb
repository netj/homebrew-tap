class Optmux < Formula
  desc "Optimal, opinionated, batteries-included TMUX — recommended extras"
  homepage "https://pypi.org/project/optmux/"
  url "https://github.com/netj/optmux/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "468ef7d25fd9b2a36df7d182691acedd5d8bcab33b5083a5d249eb3fe57c1337"
  version "0.1.2"
  license "MIT"

  depends_on "netj/tap/wtcode"
  depends_on "lazygit"

  def install
    # optmux itself is installed via: uvx optmux
    # This formula provides the recommended companion tools.
    pkgshare.install "README.md"
  end

  def caveats
    <<~EOS
      optmux itself is installed via: uvx optmux
      This formula installs recommended tools (wtcode, lazygit).
    EOS
  end

  test do
    assert_predicate pkgshare/"README.md", :exist?
  end
end
