class Optmux < Formula
  desc "Optimal, opinionated, batteries-included TMUX — recommended extras"
  homepage "https://pypi.org/project/optmux/"
  url "https://github.com/netj/optmux/archive/refs/tags/v0.14.3.tar.gz"
  sha256 "389a7e55418f7b2fdb838b53096dbbe5df957e6c89dbc1ed116ae45277bf956f"
  version "0.14.3"
  license "MIT"

  depends_on "uv" => :build
  depends_on "python@3.15"
  depends_on "tmux"
  depends_on "netj/tap/wtcode"
  depends_on "lazygit"
  depends_on "git-delta"
  depends_on "less" # recent less for --mouse and clickable OSC 8 links
  depends_on "fzf"
  depends_on "universal-ctags" # tags for optmux Find (C-M-f)
  depends_on "gh"

  def install
    # Self-contained venv with dependencies pinned by uv.lock; nothing is
    # fetched when optmux runs.
    ENV["UV_PROJECT_ENVIRONMENT"] = libexec.to_s
    ENV["UV_PYTHON_DOWNLOADS"] = "never"
    system "uv", "sync", "--frozen", "--no-dev", "--no-editable",
           "--python", Formula["python@3.15"].opt_bin/"python3.15"
    bin.install_symlink libexec/"bin/optmux"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/optmux -v")
  end
end
