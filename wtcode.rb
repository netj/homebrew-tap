class Wtcode < Formula
  desc "Effortlessly launch your favorite code tool in a git worktree"
  homepage "https://pypi.org/project/wtcode/"
  head "https://github.com/netj/wtcode.git", branch: "main"

  url "https://github.com/netj/wtcode/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "d228fb31ce745321200477ccf1ec343501c9c9b94f500e06329b71e7a105fe89"
  version "0.6.0"
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
