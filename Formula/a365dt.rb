class A365dt < Formula
  desc "Download Anime365 episodes without guessing translations"
  homepage "https://github.com/Gridness/a365dt"
  version "0.7.0"
  license "Apache-2.0"
  depends_on "ffmpeg-full" => :optional
  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/Gridness/a365dt/releases/download/v0.7.0/a365dt-v0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "f661565963b6bba3feff985be4306d5c81b60d52f790c0bb05ecfc53347ea8f0"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Gridness/a365dt/releases/download/v0.7.0/a365dt-v0.7.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b008fb2dc095d5204195997b792b2fca869724110238f54db86620bfb8b6a991"
    end
    on_intel do
      url "https://github.com/Gridness/a365dt/releases/download/v0.7.0/a365dt-v0.7.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8cc44a29b2eb52d0270c28ba0add65f34dc31dc4372a2fd8955169b5e735cec9"
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
