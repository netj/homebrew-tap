class Remocon < Formula
  desc "a tool for controlling remote host's clones of local git work trees"
  homepage "https://github.com/netj/remocon#readme"
  head "https://github.com/netj/remocon.git", branch: "main"

  url "https://github.com/netj/remocon/archive/v0.6.0.tar.gz"
  sha256 "938c3116eea992868dc0f14253dbcbc4bbf7b00dbe3e2edb7d4c962e42a941f4"
  version "0.6.0"

  depends_on "rsync" => :optional
  depends_on "bash-completion@2" => :optional

  def install
    bin.install "remocon"
    doc.install "README.md"
    bash_completion.install "remocon-completion.bash"
  end

  # FIXME upstream this test
  #test do
  #  system "git", "clone", head.url
  #  system "bash", "-xeuc", "
  #  target=\"$PWD/target/remocon\"
  #  export remote=\"localhost:${target%/remocon}\"
  #  PATH=\"#{bin}:$PATH\"
  #  cd remocon
  #  remocon put

  #  date >foo
  #  git add foo
  #  remocon put
  #  diff -u {,\"$target\"/}foo

  #  date >>README.md
  #  remocon put
  #  diff -u {,\"$target\"/}README.md

  #  date >>\"$target\"/README.md
  #  date  >\"$target\"/bar
  #  remocon get
  #  diff -u {,\"$target\"/}README.md
  #  diff -u {,\"$target\"/}bar
  #  "
  #end
end
