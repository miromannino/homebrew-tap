class GitImportContributions < Formula
  desc "Tool to import contributions into a Git repository from stats or other repositories"
  homepage "https://github.com/miromannino/Contributions-Importer-For-Github"
  url "https://github.com/miromannino/Contributions-Importer-For-Github/archive/refs/tags/2.0.2.tar.gz"
  sha256 "215d0b5bf185cdbced3d45760c4c97c07a2a205158d74e8a9db3b9d13906803c"
  license "MIT"

depends_on "python" => :recommended
depends_on "python" => ">=3.11"


  def install
    system "pip3", "install", "--prefix=#{prefix}", "gitpython"
    system "python3", *Language::Python.setup_install_args(prefix)
  end

  test do
    output = shell_output("#{bin}/git-import-contributions --help", 2)
    assert_match "Unified CLI for Contribution Importer", output
  end
end
