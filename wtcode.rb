class Wtcode < Formula
  desc "Effortlessly launch your favorite code tool in a git worktree"
  homepage "https://pypi.org/project/wtcode/"
  head "https://github.com/netj/wtcode.git", branch: "main"

  url "https://github.com/netj/wtcode/archive/refs/tags/v0.7.1.tar.gz"
  sha256 "ac1fb159dce2a705fe2ba683f3247fe961c67a7d1b72d1e572cbe62079fdd043"
  version "0.7.1"
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
