class Wtcode < Formula
  desc "Effortlessly launch your favorite code tool in a git worktree"
  homepage "https://github.com/netj/wtcode#readme"
  head "https://github.com/netj/wtcode.git", branch: "main"

  url "https://github.com/netj/wtcode/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "baf3104d5bcd0eadc1d028b86b61b4671ab1f2c412c79bc18df8971caa65cbd3"
  version "0.1.0"
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
