class A365dt < Formula
  desc "Download Anime365 episodes without guessing translations"
  homepage "https://github.com/Gridness/a365dt"
  version "2.1.0"
  license "Apache-2.0"
  depends_on "ffmpeg-full" => :optional
  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/Gridness/a365dt/releases/download/v2.1.0/a365dt-v2.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "17882fc26e7fa9dfdd10abcb3345146e849227c24cfe50332416dedddca6556d"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Gridness/a365dt/releases/download/v2.1.0/a365dt-v2.1.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "bb1a342aec4183f51317d9dc96dbd24b109cca03956cff804e109b8973f31b6d"
    end
    on_intel do
      url "https://github.com/Gridness/a365dt/releases/download/v2.1.0/a365dt-v2.1.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a7563179f4aaf5f54075089a5615967a99b3baae22fd2efe31bf66ece288bab8"
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
