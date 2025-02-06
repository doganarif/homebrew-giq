class Giq < Formula
  desc 'Git wrapper enhanced with AI-powered features'
  homepage 'https://github.com/doganarif/giq'
  url 'https://api.github.com/repos/doganarif/giq/releases/latest', using: :nounzip
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url do
        require 'json'
        json = JSON.parse(File.read(@resource.cached_download))
        latest_release = json['tag_name']
        "https://github.com/doganarif/giq/releases/download/#{latest_release}/giq_#{latest_release.delete_prefix('v')}_darwin_arm64.tar.gz"
      end
    else
      url do
        require 'json'
        json = JSON.parse(File.read(@resource.cached_download))
        latest_release = json['tag_name']
        "https://github.com/doganarif/giq/releases/download/#{latest_release}/giq_#{latest_release.delete_prefix('v')}_darwin_amd64.tar.gz"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url do
        require 'json'
        json = JSON.parse(File.read(@resource.cached_download))
        latest_release = json['tag_name']
        "https://github.com/doganarif/giq/releases/download/#{latest_release}/giq_#{latest_release.delete_prefix('v')}_linux_amd64.tar.gz"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url do
        require 'json'
        json = JSON.parse(File.read(@resource.cached_download))
        latest_release = json['tag_name']
        "https://github.com/doganarif/giq/releases/download/#{latest_release}/giq_#{latest_release.delete_prefix('v')}_linux_arm64.tar.gz"
      end
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
