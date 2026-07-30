class A365dt < Formula
  desc "Download Anime365 episodes without guessing translations"
  homepage "https://github.com/Gridness/a365dt"
  version "0.9.0"
  license "Apache-2.0"
  depends_on "ffmpeg-full" => :optional
  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/Gridness/a365dt/releases/download/v0.9.0/a365dt-v0.9.0-aarch64-apple-darwin.tar.gz"
      sha256 "18589525c9502f07bb94f1fa9e8f7163c809a95e40423405255ae33d344e60b6"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Gridness/a365dt/releases/download/v0.9.0/a365dt-v0.9.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ad6bf94233ea404efa0efb5270eb8c4207d5b9ecf856b5f335c85034195a6d82"
    end
    on_intel do
      url "https://github.com/Gridness/a365dt/releases/download/v0.9.0/a365dt-v0.9.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "71c7a93ac13984a5b1e7f413832d7c3ef2bc1eb4f8d0679607bd383a02711693"
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
