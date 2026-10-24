class Optmux < Formula
  desc "Optimal, opinionated, batteries-included TMUX — recommended extras"
  homepage "https://pypi.org/project/optmux/"
  url "https://github.com/netj/optmux/releases/download/v0.11.0/optmux-0.11.0-py3-none-any.whl", using: :nounzip
  sha256 "85a6c064bdca063c3689cc8fef451694ad772f8e6b8de855580b43f20973c976"
  version "0.11.0"
  license "MIT"

  depends_on "python@3.13"
  depends_on "netj/tap/wtcode"
  depends_on "lazygit"

  # Pinned to uv.lock. Wheels and sdists only: no build backends, no uv, no
  # dependency resolution, and nothing fetched when optmux runs.
  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/05/8e/961c0007c59b8dd7729d542c61a4d537767a59645b82a0b521206e1e25c2/pyyaml-6.0.3.tar.gz"
    sha256 "d76623373421df22fb4cf8817020cbb7ef15c725b9d5e45f17e189bfc384190f"
  end

  resource "libtmux" do
    url "https://files.pythonhosted.org/packages/8b/34/b11ab24abb78c73a1b82f6471c2d71bdd1bf2c8f30768ed2f26f1dddc083/libtmux-0.55.0-py3-none-any.whl"
    sha256 "4b746533856e022c759e5c5cae97f4932e85dae316a2afd4391d6d0e891d6ab8"
  end

  resource "tmuxp" do
    url "https://files.pythonhosted.org/packages/15/e8/78d77e47ef13cab906d59dda75d51c0dff3f067b008b869d69022ecb8266/tmuxp-1.67.0-py3-none-any.whl"
    sha256 "9c6c407384413a842cf391fa6d4d2b6cbaf3c6c480c9f4a5726e593cbfecdcfc"
  end

  def install
    venv = virtualenv_create(libexec, "python3.13")
    venv.pip_install resources
    # The main download is the release wheel itself.
    system libexec/"bin/python", "-m", "pip", "install", "--no-deps", "--no-index",
           "--ignore-installed", "--no-compile", cached_download
    bin.install_symlink libexec/"bin/optmux"
  end

  test do
    system libexec/"bin/python", "-c", "import optmux.cli, tmuxp, yaml"
  end
end
