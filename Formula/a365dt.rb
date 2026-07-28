class A365dt < Formula
  desc "Download Anime365 episodes without guessing translations"
  homepage "https://github.com/Gridness/a365dt"
  version "0.6.2"
  license "Apache-2.0"
  depends_on "ffmpeg-full" => :optional
  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/Gridness/a365dt/releases/download/v0.6.2/a365dt-v0.6.2-aarch64-apple-darwin.tar.gz"
      sha256 "28c78e1edbd3682771221ebdf137b52659af971b52c0f4d8c71436706f8dff2e"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Gridness/a365dt/releases/download/v0.6.2/a365dt-v0.6.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "458c1ab8907908e552becc152915de044bc3ef47fc73f2009e86be0a25d211a5"
    end
    on_intel do
      url "https://github.com/Gridness/a365dt/releases/download/v0.6.2/a365dt-v0.6.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c0cd6a78cbd85b49623b769a400ec8b28d44a4444564b9174d449c240b207414"
    end
  end
  def install
    bin.install "a365dt"
    generate_completions_from_executable bin/"a365dt", "completions"
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/a365dt --version")
  end
end
