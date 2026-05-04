class Wtcode < Formula
  desc "Effortlessly launch your favorite code tool in a git worktree"
  homepage "https://pypi.org/project/wtcode/"
  head "https://github.com/netj/wtcode.git", branch: "main"

  url "https://github.com/netj/wtcode/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "018b06e05cf497e377a7a05b55baccb526c0afa7accb59f080bba4aec19b0a69"
  version "0.1.4"
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
