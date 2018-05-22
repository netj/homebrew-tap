class Remocon < Formula
  desc "a tool for controlling remote host's clones of local git work trees"
  homepage "https://github.com/netj/remocon#readme"
  head "https://github.com/netj/remocon.git"

  url "https://github.com/netj/remocon/archive/v0.3.1.tar.gz"
  sha256 "11d7f7f2bac45d01525f75e82ea13e91e3d62181dd2ff214c2df56023ec60b06"
  version "0.3.1"

  depends_on "rsync" => :optional

  def install
    bin.install "remocon"
    doc.install "README.md"
  end

  test do
    system "git", "clone", head.url
    system "bash", "-xeuc", "
    target=\"$PWD/target/remocon\"
    export remote=\"localhost:${target%/remocon}\"
    PATH=\"#{bin}:$PATH\"
    cd remocon
    remocon put

    date >foo
    git add foo
    remocon put
    diff -u {,\"$target\"/}foo

    date >>README.md
    remocon put
    diff -u {,\"$target\"/}README.md

    date >>\"$target\"/README.md
    date  >\"$target\"/bar
    remocon get
    diff -u {,\"$target\"/}README.md
    diff -u {,\"$target\"/}bar
    "
  end
end
