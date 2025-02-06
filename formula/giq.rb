class Giq < Formula
  desc 'Git wrapper enhanced with AI-powered features'
  homepage 'https://github.com/doganarif/giq'
  version '0.1.4'

  stable do
    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/doganarif/giq/releases/download/v#{version}/giq_#{version}_darwin_arm64.tar.gz"
      else
        url "https://github.com/doganarif/giq/releases/download/v#{version}/giq_#{version}_darwin_amd64.tar.gz"
      end
    end

    on_linux do
      if Hardware::CPU.intel?
        url "https://github.com/doganarif/giq/releases/download/v#{version}/giq_#{version}_linux_amd64.tar.gz"
      elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/doganarif/giq/releases/download/v#{version}/giq_#{version}_linux_arm64.tar.gz"
      end
    end
  end

  head do
    url 'https://github.com/doganarif/giq.git', branch: 'main'
  end

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on 'git'

  def install
    bin.install 'giq'
  end

  test do
    system "#{bin}/giq", '--version'
  end
end
