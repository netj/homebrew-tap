class Wtcode < Formula
  desc "Effortlessly launch your favorite code tool in a git worktree"
  homepage "https://pypi.org/project/wtcode/"
  head "https://github.com/netj/wtcode.git", branch: "main"

  url "https://github.com/netj/wtcode/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "7a471eb2f80ba1fc1d761ef15ae42ab621eca7ab621c2cc6ba54cfa62d50633"
  version "0.5.0"
  license "MIT"

  depends_on "fzf" => :recommended
  depends_on "jq" => :optional

  def install
    bin.install "wtcode.sh" => "wtcode"
  end

  test do
    assert_match "wtcode", shell_output("#{bin}/wtcode --version")
  end
end
