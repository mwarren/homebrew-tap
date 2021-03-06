require 'formula'

# original from: https://gist.githubusercontent.com/dustinschultz/6544364/raw/5bbe233fbe953b8070c5453fdf09cd65eb515e9e/dblatex.rb
 
class Dblatex < Formula
  env :userpaths
  url 'http://downloads.sourceforge.net/project/dblatex/dblatex/dblatex-0.3.9/dblatex-0.3.9.tar.bz2'
  homepage 'http://dblatex.sourceforge.net'
  sha256 '06e039f841bc9f163555da2fdeeaba65e45fd4aa0d621c54ff9c7b990bfbb15d'
 
  def install
    system "python", "setup.py", "install", "--prefix=#{prefix}", "--install-scripts=#{bin}"
  end
 
  def patches
    #Fixes attr error install_layout
    DATA
  end
end
 
__END__
diff --git a/setup.py b/setup.py
index 2fa793f..a842cc0 100644
--- a/setup.py
+++ b/setup.py
@@ -365,10 +365,7 @@ class Install(install):
             raise OSError("not found: %s" % ", ".join(mis_stys))
 
     def run(self):
-        if self.install_layout == "deb":
-            db = DebianInstaller(self)
-        else:
-            db = None
+        db = None
 
         if not(db) and not(self.nodeps):
             try:
