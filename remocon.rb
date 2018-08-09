class Remocon < Formula
  desc "a tool for controlling remote host's clones of local git work trees"
  homepage "https://github.com/netj/remocon#readme"
  head "https://github.com/netj/remocon.git"

  url "https://github.com/netj/remocon/archive/v0.4.0.tar.gz"
  sha256 "f2f3ac21c119d70b9eb753c132ce02ab3630f8b7de81fa2b02f11e4c5ebb8894"
  version "0.4.0"

  depends_on "rsync" => :optional
  depends_on "bash-completion@2" => :optional

  def install
    bin.install "remocon"
    doc.install "README.md"
    bash_completion.install "remocon-completion.bash"
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
