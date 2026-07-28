class A365dt < Formula
  desc "Download Anime365 episodes without guessing translations"
  homepage "https://github.com/Gridness/a365dt"
  version "0.7.3"
  license "Apache-2.0"
  depends_on "ffmpeg-full" => :optional
  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/Gridness/a365dt/releases/download/v0.7.3/a365dt-v0.7.3-aarch64-apple-darwin.tar.gz"
      sha256 "b9aaaba810612b85f88a20069a32d96710cd8c0f8524c0e9b3817f5e3764111c"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Gridness/a365dt/releases/download/v0.7.3/a365dt-v0.7.3-aarch64-unknown-linux-musl.tar.gz"
      sha256 "dc437463783c5837f740a2331a201bb34b24df7730fe7d2d983f4e597222c397"
    end
    on_intel do
      url "https://github.com/Gridness/a365dt/releases/download/v0.7.3/a365dt-v0.7.3-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9684f9b8dc1236af5531071299f700b8f0faf1e2cf712adee380b5d1fd848e08"
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
