class Remocon < Formula
  desc "a tool for controlling remote host's clones of local git work trees"
  homepage "https://github.com/netj/remocon#readme"
  head "https://github.com/netj/remocon.git"

  url "https://github.com/netj/remocon/archive/v0.3.4.tar.gz"
  sha256 "588349cc92afad44eee34f7b75eb120262c0434d1667a607eb7f77b317bc54ad"
  version "0.3.4"

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
