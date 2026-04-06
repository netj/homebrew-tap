class Optmux < Formula
  desc "Optimal, opinionated, batteries-included TMUX — recommended extras"
  homepage "https://pypi.org/project/optmux/"
  url "https://github.com/netj/optmux/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "93f8252d87628c8b6a4a97b6f13655cfcccb97141a373c8ae79a5240b2716698"
  version "0.1.1"
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
