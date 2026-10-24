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
    # Self-contained venv with dependencies pinned by uv.lock; nothing is
    # fetched when optmux runs.
    ENV["UV_PROJECT_ENVIRONMENT"] = libexec.to_s
    ENV["UV_PYTHON_DOWNLOADS"] = "never"
    system "uv", "sync", "--frozen", "--no-dev", "--no-editable",
           "--python", Formula["python@3.13"].opt_bin/"python3.13"
    bin.install_symlink libexec/"bin/optmux"
  end

  test do
    system libexec/"bin/python", "-c", "import optmux.cli, tmuxp, yaml"
  end
end
