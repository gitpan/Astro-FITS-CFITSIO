use ExtUtils::MakeMaker;

my ($inc, $libs);

if (exists $ENV{CFITSIO}) {
  $inc = "-I$ENV{CFITSIO}";
  $libs = "-L$ENV{CFITSIO} -lcfitsio -lm";
}
else {
  warn("CFITSIO environment variable not found, assuming /usr/local/cfitsio\n");
  $inc = "-I/usr/local/cfitsio";
  $libs = "-L/usr/local/cfitsio -lcfitsio -lm";
}

# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    'NAME'	=> 'Astro::FITS::CFITSIO',
    'VERSION_FROM' => 'CFITSIO.pm', # finds $VERSION
    'LIBS'	=> [$libs],
    'INC'	=> $inc,
    'DEFINE'	=> '',
    'OBJECT' => 'CFITSIO.o util.o',
    'clean' => { FILES => "testprog.fit testprog/testprog.fit testprog/testprog.lis" },
);
