NAME=main
TEX=$(NAME).tex
EXT=pdf
DEST=$(NAME).$(EXT)
ifeq ($(EXT), dvi)
	VIEWER=xdvi
else
	VIEWER=zathura
endif

all : $(DEST)

$(NAME).dvi : $(TEX) *.tex
	latex $<

$(NAME).ps : $(NAME).dvi
	dvips $<

$(NAME).pdf : $(TEX) *.tex
	pdflatex $<

clean :
	@rm -vf `ls --ignore=Makefile --ignore=*.tex --ignore=*.sty --ignore=pkgs --ignore=docs --ignore=rc`

remove :
	@rm -vf $(DEST)

re : remove $(DEST)

rec : clean $(DEST)

view : $(DEST)
	$(VIEWER) $^

.PHONY: all re rec clean view remove


