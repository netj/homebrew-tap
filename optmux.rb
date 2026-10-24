class Optmux < Formula
  desc "Optimal, opinionated, batteries-included TMUX — recommended extras"
  homepage "https://pypi.org/project/optmux/"
  url "https://github.com/netj/optmux/archive/refs/tags/v0.11.0.tar.gz"
  sha256 "eee5a3f1c8200e957337300aa17b409c83241302b0169f3397b303e5ada8c42d"
  version "0.11.0"
  license "MIT"

  depends_on "uv" => :build
  depends_on "python@3.13"
  depends_on "netj/tap/wtcode"
  depends_on "lazygit"

  def install
    # Install into a private venv from the tarball itself, with dependencies
    # pinned (and hash-verified) by uv.lock, so runtime never needs PyPI.
    python = Formula["python@3.13"].opt_bin/"python3.13"
    venv = libexec/"venv"
    system "uv", "venv", "--python", python, venv
    system "uv", "export", "--frozen", "--no-emit-project", "--no-dev",
           "--format", "requirements-txt", "-o", "requirements.txt"
    system "uv", "pip", "install", "--python", venv/"bin/python",
           "--require-hashes", "--no-deps", "-r", "requirements.txt"
    system "uv", "pip", "install", "--python", venv/"bin/python",
           "--no-deps", "--no-cache", "."
    bin.install_symlink venv/"bin/optmux"
  end

  test do
    system libexec/"venv/bin/python", "-c", "import optmux.cli, tmuxp"
  end
end
