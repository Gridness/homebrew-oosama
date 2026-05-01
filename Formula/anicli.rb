class Anicli < Formula
  desc "Watch your favorite titles right in the terminal"
  homepage "https://github.com/Gridness/anicli"
  license "AGPL-3.0-or-later"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Gridness/anicli/releases/download/v0.1.0/anicli-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "27526e6eedf3445a1ca3c586fa6e3b7199907f1f1190dffce5f17299816eafdb"
    else
      url "https://github.com/Gridness/anicli/releases/download/v0.1.0/anicli-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "335a73a177936bc1be93a88acc4e7676c6c49d6264cb265915e325874e9c66db"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Gridness/anicli/releases/download/v0.1.0/anicli-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "551896c0cf182d548d35238d48ebe9be885ef4d972528d004521bdd6b9e1514a"
    else
      url "https://github.com/Gridness/anicli/releases/download/v0.1.0/anicli-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dd2e79fcf8c86cbd0449540e69b6a970cf4e676e20d63daa7c782979053dd6ff"
    end
  end

  def install
    bin.install "anicli"
  end

  test do
    assert_equal "anicli", shell_output("#{bin}/anicli --version").chomp
  end
end
