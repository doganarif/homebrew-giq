class Giq < Formula
  desc 'Git wrapper enhanced with AI-powered features'
  homepage 'https://github.com/doganarif/giq'
  version '0.1.2'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/doganarif/giq/releases/download/v#{version}/giq_#{version}_darwin_arm64.tar.gz"
      sha256 'LEAVE_BLANK' # GoReleaser will update this
    else
      url "https://github.com/doganarif/giq/releases/download/v#{version}/giq_#{version}_darwin_amd64.tar.gz"
      sha256 'LEAVE_BLANK' # GoReleaser will update this
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/doganarif/giq/releases/download/v#{version}/giq_#{version}_linux_amd64.tar.gz"
      sha256 'LEAVE_BLANK' # GoReleaser will update this
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/doganarif/giq/releases/download/v#{version}/giq_#{version}_linux_arm64.tar.gz"
      sha256 'LEAVE_BLANK' # GoReleaser will update this
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
