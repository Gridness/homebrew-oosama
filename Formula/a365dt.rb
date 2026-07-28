class A365dt < Formula
  desc "Download Anime365 episodes without guessing translations"
  homepage "https://github.com/Gridness/a365dt"
  version "0.6.1"
  license "Apache-2.0"
  depends_on "ffmpeg-full" => :optional
  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/Gridness/a365dt/releases/download/v0.6.1/a365dt-v0.6.1-aarch64-apple-darwin.tar.gz"
      sha256 "4ff1a85334e5cb9b555fd9ec2523332b4338dfb50eea693dd5cb7134ae517142"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Gridness/a365dt/releases/download/v0.6.1/a365dt-v0.6.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a67b8df5a40ac593c060d32f4fa56cbd8dda33d12c7a38d183d6f7721c99b5a0"
    end
    on_intel do
      url "https://github.com/Gridness/a365dt/releases/download/v0.6.1/a365dt-v0.6.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "78cbef54c9714ffca2ce4ffefef15c274e00c9ea130cafa8c95021fb7c6fe57c"
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
