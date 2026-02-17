class TmuxCron < Formula
  desc "Tmux-based cron scheduler with visible, interactive job panes"
  homepage "https://github.com/netj/tmux-cron"
  url "https://github.com/netj/tmux-cron/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "754a33a92e647dae06df4aaf7b19b67dff7888e6b788485ba729a649e723a058"
  license "MIT"
  head "https://github.com/netj/tmux-cron.git", branch: "main"

  depends_on :macos
  depends_on "tmux"
  depends_on "uv"

  def install
    bin.install "tmux-cron.py" => "tmux-cron"
  end

  service do
    run opt_bin/"tmux-cron"
    run_type :immediate
    launch_only_once true
    process_type :background
    environment_variables PATH: "#{HOMEBREW_PREFIX}/bin:#{HOMEBREW_PREFIX}/sbin:/usr/bin:/bin:/usr/sbin:/sbin"
    log_path var/"log/tmux-cron.log"
    error_log_path var/"log/tmux-cron.log"
  end

  def caveats
    <<~EOS
      To start tmux-cron at login:
        brew services start tmux-cron

      Then edit your schedule:
        tmux-cron -e

      To migrate your existing crontab:
        tmux-cron --migrate-from-crontab
    EOS
  end

  test do
    assert_match "usage:", shell_output("#{bin}/tmux-cron -h 2>&1")
  end
end
