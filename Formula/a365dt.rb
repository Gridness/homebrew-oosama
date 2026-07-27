class A365dt < Formula
  desc "Download Anime365 episodes without guessing translations"
  homepage "https://github.com/Gridness/a365dt"
  version "0.6.0"
  license "Apache-2.0"
  depends_on "ffmpeg-full" => :optional
  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/Gridness/a365dt/releases/download/v0.6.0/a365dt-v0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "35515092a0f9821d42532f7e23654434f0893cd4c1abab755e939225bac81656"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Gridness/a365dt/releases/download/v0.6.0/a365dt-v0.6.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "2f28a037a8a49274ead4e9fe8df3c3b3c5865b91410e2f9ec4c4edd030c252cc"
    end
    on_intel do
      url "https://github.com/Gridness/a365dt/releases/download/v0.6.0/a365dt-v0.6.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "5d8abd2bcc5f36e7d39fbf7d5f7f333b88840c26572c93ed1f914cf547297912"
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
