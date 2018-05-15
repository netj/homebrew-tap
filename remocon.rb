class Remocon < Formula
  desc "a simple tool for controlling remote host git repos"
  homepage "https://github.com/netj/remocon#readme"
  head "https://github.com/netj/remocon.git"

  url "https://github.com/netj/remocon/archive/v0.1.0.tar.gz"
  sha256 "eabfd550e2f6630a1ac0b26dc44cecfb2b8f2232cdd71639b85342c31658ea70"
  version "0.1.0"

  depends_on "rsync" => :optional

  def install
    bin.install "remocon"
  end

  test do
    system "#{bin}/remocon", "help"
  end
end
