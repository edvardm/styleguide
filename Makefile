all: pyguide-mod.md


BLACK=github.com/psf/black

# TODO: find sed command that works in Linux/MacOS, which
# recognizes word-boundaries properly (max line length adjustment)
pyguide-mod.md: pyguide.md Makefile  # anything original guide says, but yapf->black
	sed -r "s#github.com/google/yapf#$(BLACK)#g;\
			s#pypi.org/project/yapf#$(BLACK)#g;\
			s/yapf/black/gI;\
			s/80/100/g;\
     		" < $< > $@

test-py-changes: pyguide-mod.md
	cp $< pyguide.md && git diff pyguide.md
	git checkout pyguide.md

