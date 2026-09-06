# typed: false
# frozen_string_literal: true

class Pulse < Formula
  desc "Deploy, validate, and troubleshoot Splunk Agent Observability"
  homepage "https://github.com/rungalileo/pulse"
  version "1.0.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://repo.splunkdev.net/artifactory/generic/observability/ao/pulse/#{version}/pulse-darwin-arm64"
      sha256 "01a5ec1194eba21d21389fb11966184218e5047fe55627072a49ff4d3348bd49"
    else
      odie "Pulse currently provides a Homebrew binary for Apple Silicon macOS only"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://repo.splunkdev.net/artifactory/generic/observability/ao/pulse/#{version}/pulse-linux-amd64"
      sha256 "a78b2887c1682acefd36ac7227b0d9d98a52aa76e3f906fa582c74f6175a5e09"
    else
      odie "Pulse currently provides a Homebrew binary for Intel Linux only"
    end
  end

  def install
    binary_name = if OS.mac?
      "pulse-darwin-arm64"
    elsif OS.linux?
      "pulse-linux-amd64"
    end

    bin.install binary_name => "pulse"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pulse version")
  end
end
