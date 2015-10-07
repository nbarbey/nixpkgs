{ stdenv, fetchurl, python, intltool, pythonPackages }:

stdenv.mkDerivation rec {
  name = "yum-3.4.3";

  src = fetchurl {
    url = "http://yum.baseurl.org/download/3.4/yum-3.4.3.tar.gz";
    sha256 = "0178f97820ced9bfbcc269e6fc3ea35e29e35e2d263d24c7bff8660ee62d37ca";
  };

  patches = ./destdir.patch; 

  buildInputs = [ 
    python 
    intltool
    pythonPackages.urlgrabber
#    pythonPackages.rpm-org
    pythonPackages.pysqlite
    pythonPackages.yum-metadata-parser
    pythonPackages.iniparse
#    pythonPackages.pyliblzma
  ];

  meta = with stdenv.lib; {
    homepage = http://yum.baseurl.org/;
    license = licenses.gpl2;
    description = "A popular channel based package manager for RPM distros.";
    platforms = platforms.linux;
  };
}
