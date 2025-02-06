class Giq < Formula
  desc 'Git wrapper enhanced with AI-powered features'
  homepage 'https://github.com/doganarif/giq'
  license 'MIT'
  head 'https://github.com/doganarif/giq.git', branch: 'main'

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/doganarif/giq/releases/latest/download/giq_darwin_arm64.tar.gz'
    else
      url 'https://github.com/doganarif/giq/releases/latest/download/giq_darwin_amd64.tar.gz'
    end
  end

  on_linux do
    url 'https://github.com/doganarif/giq/releases/latest/download/giq_linux_amd64.tar.gz' if Hardware::CPU.intel?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/doganarif/giq/releases/latest/download/giq_linux_arm64.tar.gz'
    end
  end

  depends_on 'git'

  def install
    bin.install 'giq'
  end

  test do
    system "#{bin}/giq", '--version'
  end
end
