all: pyguide-mod.md


BLACK=github.com/psf/black

pyguide-mod.md: pyguide.md Makefile  # anything original guide says, but yapf->black
	sed -e "s#github.com/google/yapf#$(BLACK)#g;s#pypi.org/project/yapf#$(BLACK)#g;s/yapf/black/gI" < $< > $@
