class GitImportContributions < Formula
  desc "Tool to import contributions into a Git repository from stats or other repositories"
  homepage "https://github.com/miromannino/Contributions-Importer-For-Github"
  url "https://github.com/miromannino/Contributions-Importer-For-Github/archive/refs/tags/2.0.1.tar.gz"
  sha256 "b8d24d344fccf56cc2a95e1e079e1599cbc415344b3817f204f1566ad5ba4f85"
  license "MIT"

  depends_on "python@3.9"

  def install
    system "pip3", "install", "--prefix=#{prefix}", "gitpython"
    system "python3", *Language::Python.setup_install_args(prefix)
  end

  test do
    output = shell_output("#{bin}/git-import-contributions --help", 2)
    assert_match "Unified CLI for Contribution Importer", output
  end
end
